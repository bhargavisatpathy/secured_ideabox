class User < ActiveRecord::Base
  has_many :ideas
  has_secure_password
  enum role: %w(default, admin)

end
