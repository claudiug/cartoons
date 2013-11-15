class Account < ActiveRecord::Base
  EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :email,
            format: {
                with:  EMAIL,
                message: "not a good email"
            }

  def name
    [username, email].join(" ")
  end





end
