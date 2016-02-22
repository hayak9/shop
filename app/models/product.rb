class Product < ActiveRecord::Base
	
	belongs_to :brand
	
	has_many :reviews, dependent: :destroy
	
	validates :name, uniqueness: true
	validates :name, :price, presence: true
	
	def average_stars
		reviews.average(:stars)
	end
end