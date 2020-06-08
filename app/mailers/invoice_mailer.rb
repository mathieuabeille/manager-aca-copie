class InvoiceMailer < ApplicationMailer
  def new_order_email
    @invoice = params[:invoice_id]
    @invoiceline = Invoiceline.new
    @invoices = Invoice.all
    @invoicelines = Invoiceline.all
    @sum = 0
    @total = @invoicelines.where(:invoice_id => @invoice.id).each do |invoicelin|
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
    @amount = @sumttc

    mail(to: "mathieu.abeille@gmail.com", subject: "Votre devis a été payée")
  end
end

