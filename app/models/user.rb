class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP

  enum role: %i[patient admin]
end
