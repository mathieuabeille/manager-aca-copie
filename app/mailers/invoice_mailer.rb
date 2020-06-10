class InvoiceMailer < ApplicationMailer
  def new_invoice_email
    @invoice = params[:invoice]
    @client = Client.where(id: @invoice.client_id)
    mail(to: @invoice.email, subject: "Admin Aca: Un devis a ete paye")
  end
end

