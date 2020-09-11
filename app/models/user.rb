class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :ratings
  has_one_attached :avatar_user

  has_many :comments
  has_many :favorite_producers
  has_many :favorites, through: :favorite_producers, source: :producer

  validates :phone_number, if: :phone_number_nil?,
    length: { is: 10 },
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/,
    message: "Le numéro de téléphone doit contenir 10 chiffres, sans espace, et être au format : 0601020304." }

  validates :first_name, presence: true, allow_blank: false, if: :names_nil?,
    length: { minimum: 1, message: "Le prénom doit contenir au moins une lettre." }

  validates :last_name, presence: true, allow_blank: false, if: :names_nil?,
    length: { minimum: 1, message: "Le nom doit contenir au moins une lettre." }

  private

  def phone_number_nil?
    phone_number != nil
  end

  def names_nil?
    first_name != nil
    last_name != nil
  end

  ### Sending an email when a user is created
  after_create :welcome_send
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # sending an email when a user is deleted
  before_destroy :goodbye_send
  def goodbye_send
    UserMailer.goodbye_email(self).deliver_now
  end

end
