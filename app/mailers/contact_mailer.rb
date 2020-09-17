class ContactMailer < ApplicationMailer

  def contact_message(contact)
    @contact = contact
    make_bootstrap_mail(to: 'jo.tournerie@gmail.com', subject: contact.subject)
  end

end
