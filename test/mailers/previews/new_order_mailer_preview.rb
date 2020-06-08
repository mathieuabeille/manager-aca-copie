# Preview all emails at http://localhost:3000ost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview
    invoice = Invoice.where(:id => 3)

    InvoiceMailer.with(invoice).new_order_email
end
