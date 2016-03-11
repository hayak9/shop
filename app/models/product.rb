class Product < ActiveRecord::Base
	belongs_to :brand
	has_many :reviews, dependent: :destroy
	has_many :lineitems
		
	validates :name, uniqueness: true
	validates :name, :price, presence: true
	
	acts_as_votable
	
	def average_stars
		reviews.average(:stars)
	end
	
	def self.search(query)
		where(" name LIKE ?", "%#{query}%")
	end
	
end