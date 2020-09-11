class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :join_table_product_categories
  has_many :categories, through: :join_table_product_category
  has_one_attached :avatar
  has_many_attached :images
  has_many :comments

  belongs_to :producer, optional: true
  has_many :favorite_producers
  has_many :favorited_by, through: :favorite_producers, source: :user
  has_many :ratings

  geocoded_by :geocode_address
  after_validation :geocode

  validates :phone_number, if: :phone_number_nil?,
    length: { is: 10 },
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/,
    message: "Le numéro de téléphone doit contenir 10 chiffres, sans espace, et être au format : 0601020304." }

  validates :first_name, presence: true, allow_blank: false, if: :names_nil?,
    length: { minimum: 1, message: "Le prénom doit contenir au moins une lettre." }

  validates :last_name, presence: true, allow_blank: false, if: :names_nil?,
    length: { minimum: 1, message: "Le nom doit contenir au moins une lettre." }

  def geocode_address
    [address,city_name, zip_code].compact.join(', ')
  end

  private

  def phone_number_nil?
    phone_number != nil
  end

  def names_nil?
    first_name != nil
    last_name != nil
  end

  ### Sending an email when a producer is created
  after_create :welcome_send
  def welcome_send
    ProducerMailer.welcome_email(self).deliver_now
  end

  ### sending an email when a producer is deleted
  before_destroy :goodbye_send
  def goodbye_send
    ProducerMailer.goodbye_email(self).deliver_now
  end

end
