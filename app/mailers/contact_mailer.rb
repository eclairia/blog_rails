class ContactMailer < ApplicationMailer
  def contact(contact)
    @contact = contact
    mail(to: 'adrien.jourdier@eemi.com', name: @contact.name, email: @contact.email, subject: @contact.message)
  end
end
