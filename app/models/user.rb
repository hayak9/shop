class User < ActiveRecord::Base
	
	has_many :reviews, dependent: :destroy
	
	has_secure_password 
	
	validates :firstname, :lastname, :email, uniqueness: true
	validates :firstname, :lastname, :email, :address, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :password, confirmation: true
	validates :password, length: { in: 6..20 }
end