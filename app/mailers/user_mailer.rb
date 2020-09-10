class UserMailer < ApplicationMailer
  default from: 'jo.tournerie@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://allons-tous-au-marche.herokuapp.com/'
    make_bootstrap_mail(to: @user.email, subject: 'Bienvenue chez TOUS AU MARCHE !')
  end

  def goodbye_email(user)
    @user = user
    @url  = 'https://allons-tous-au-marche.herokuapp.com/users/sign_up'
    make_bootstrap_mail(to: @user.email, subject: 'On se revoit bientôt ?')
  end

end
