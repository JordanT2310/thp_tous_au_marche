class Contact < ApplicationRecord
  validates :email,
    presence: { message: "L'email doit être rempli"}, allow_blank: false
  validates :subject,
    presence: { message: "Le sujet doit être rempli"}, allow_blank: false
  validates :message,
    presence: { message: "Le message doit être rempli"}, allow_blank: false

  def send_message
    ContactMailer.contact_message(self).deliver_now
  end
end
