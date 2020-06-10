class InvoiceMailer < ApplicationMailer
  def new_invoice_email
    @invoice = @invoiceobject
    @invoiceline = Invoiceline.new
    @invoices = Invoice.all
    mail(to: @invoice.email, subject: "Admin Aca: Un devis a ete paye")
  end
end

