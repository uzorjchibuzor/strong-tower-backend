class User < ApplicationRecord
  has_secure_password

  enum role: %i[patient admin]
end
