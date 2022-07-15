class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
end
