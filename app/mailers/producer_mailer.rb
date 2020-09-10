class ProducerMailer < ApplicationMailer
  default from: 'jo.tournerie@gmail.com'

  def welcome_email(producer)
    @producer = producer
    @url  = 'https://allons-tous-au-marche.herokuapp.com/'
    make_bootstrap_mail(to: @producer.email, subject: 'Bienvenue chez TOUS AU MARCHE !')
  end

  def goodbye_email(producer)
    @producer = producer
    @url  = 'https://allons-tous-au-marche.herokuapp.com/producers/sign_up'
    make_bootstrap_mail(to: @producer.email, subject: 'On se revoit bientôt ?')
  end

end
