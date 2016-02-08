class Review < ActiveRecord::Base
	
	belongs_to :product
	belongs_to :user
	
	validates_inclusion_of  :stars, :in => ( 0..10 )	
end