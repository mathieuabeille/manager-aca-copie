class ChargesController < ApplicationController
  before_action :authenticate_user!, :except => [:new, :create]

  def new
  end

  def create
  # Amount in cents
  @invoice = params[:invoice_id].to_i
  @invoiceobject = Invoice.where(:id => @invoice)
  @invoiceline = Invoiceline.new
  @invoices = Invoice.all
  @invoicelines = Invoiceline.all
  @sum = 0
  @total = @invoicelines.where(:invoice_id => @invoice).each do |invoicelin|
    @invoicelin = invoicelin
    if invoicelin.price.present?
      price =   invoicelin.price.to_i
    elsif invoicelin.label.present?
      price =  invoicelin.label.price.to_i
    else
      price = 0
    end
    quantity = invoicelin.quantity.to_i
    @sum+= quantity*price
    @sumttc= @sum*1.20
  end
  respond_to do |format|
    format.html
    format.pdf do
      render  pdf: 'invoice', template: 'invoices/invoice',
      page_size: 'A4',
      encoding:"UTF-8"
      end # Excluding ".pdf" extension.
    end
    @amount2 = @sumttc
    @amount = @sumttc*100

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    @invoiceobject.update({
      status: "paiement effectué"
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount.to_i,
      description: @invoice,
      currency: 'eur'
    })

    InvoiceMailer.with(invoice: @invoiceobject).new_order_email.deliver_later


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
    @invoiceobject.update({
      status: "paiement echoué"
    })
  end
end
