class Brand < ActiveRecord::Base
	
	has_many :products, dependent: :destroy
	validates :name, uniqueness: true
	validates :name, :image, presence: true
end