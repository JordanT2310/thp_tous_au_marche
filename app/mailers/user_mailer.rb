class UserMailer < ApplicationMailer
  default from: 'jo.tournerie@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://allons-tous-au-marche.herokuapp.com/login'
    make_bootstrap_mail(to: @user.email, subject: 'Bienvenue sur votre espace utilisateur TOUS AU MARCHE !')
  end

  def goodbye_email(user)
    @user = user
    @url  = 'https://allons-tous-au-marche.herokuapp.com'
    make_bootstrap_mail(to: @user.email, subject: 'On se revoit bientôt ?')
  end

end
