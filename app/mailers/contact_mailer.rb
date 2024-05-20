class ContactMailer < ApplicationMailer
  def send_contact_details(contact)
    @contact = contact
    mail(to: 'pawan@admin.com', subject: 'New Contact Message')
  end
end
