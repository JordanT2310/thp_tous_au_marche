class ContactMailer < ApplicationMailer
  default from: 'jo.tournerie@gmail.com'

  def contact_message(contact)
    @contact = contact
    mail to: 'jo.tournerie@gmail.com', subject: contact.subject
    # make_bootstrap_mail(to: @user.email, subject: 'Bienvenue sur votre espace utilisateur TOUS AU MARCHE !')
  end
end
