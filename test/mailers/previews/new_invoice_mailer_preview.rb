# Preview all emails at http://localhost:3000ost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview
  def new_invoice_email
    @invoice = Invoice.new(:name => "Joee Smith", :email => "joee@gmail.com", :client_id => 2)
    InvoiceMailer.with(invoice: @invoice).new_invoice_email
  end
end
