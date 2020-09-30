# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Producer.destroy_all
User.destroy_all

require 'faker'


last_name = ['Meunevrier', 'Zouhairi', 'Manein', 'Audoy', 'Fournier', 'Coiral', 'Sandret']
first_name = ['Didier', 'Abdelkader', 'Bernard', 'Stéphane', 'Jean-Pierre', 'Gilles', 'Albert']
city_name = ['GAURIAC','CASTILLON LA BATAILLE','BEYCHAC ET CAILLAU','CISSAC MEDOC','HAUX','LE TOURNE','SAINT-MAGNE']
zip_code = ['33710','33350','33750','33250','33550','33530','33125']
address = ['Le Rigalet','5 rue Victor Hugo','1 route de Perriche','15 route des Gunes','747 route du Bourg','231 chemin de Pic','5 Route de Haureuils']

i = 0
7.times do
  Producer.create(
    email: Faker::Internet.email,
    password: 'azerty',
    password_confirmation: 'azerty',
    first_name: first_name[i],
    last_name: last_name[i],
    description: Faker::GreekPhilosophers.quote,
    address: address[i],
    city_name: city_name[i],
    zip_code: zip_code[i],
    phone_number: '0601020304',
    website: Faker::Internet.url,
  )
i += 1
end

User.create(email: 'teste@test.com', password: 'azerty', first_name: 'John', last_name: 'Doe')

10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'azerty',
    password_confirmation: 'azerty',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: '0601020304',
  )
end
