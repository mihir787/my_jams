class User < ActiveRecord::Base

  has_many :songs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true

  has_secure_password
  enum role: %w(default, admin)

  def admin?
    role == "admin"
  end
end
