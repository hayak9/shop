module ApplicationHelper
	def euro(amount)
		number_to_currency(amount, :unit=>'€')
	end
	
	def signed_in?
		if session[:user_id].nil?
			return
		else
		@current_user = User.find_by_id(session[:user_id])
		end
	end
end
