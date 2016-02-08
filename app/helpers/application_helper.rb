module ApplicationHelper
	def euro(amount)
		number_to_currency(amount, :unit=>'€')
	end
end
