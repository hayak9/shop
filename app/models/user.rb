class User < ActiveRecord::Base
	
	has_many :reviews
	has_many :orders	
	has_secure_password 
	
	acts_as_voter
	
	validates :email, uniqueness: true
	validates :firstname, :lastname, :email, :address, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :password, confirmation: true
	validates :password, length: { in: 6..20 }
		
	scope :admin, -> { where(admin: true) }
	scope :casual, -> { where(admin: false) }

	def self.setAdmin(user) 
		if !user.nil? 
			if !user.admin?
				if user.admincode.eql? "hb145294"
					user.admin = true
					user.save
				end
			end
		end
	end

end