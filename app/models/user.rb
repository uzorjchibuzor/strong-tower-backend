class User < ApplicationRecord
  has_secure_password
  has_many :appointments, dependent: :destroy

  enum role: %i[patient admin]
end
