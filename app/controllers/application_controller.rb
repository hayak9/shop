class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_last_seen_at, if: proc {
  signed_in? && (session[:last_seen_at] == nil || session[:last_seen_at] < 15.minutes.ago)
  }

  include ApplicationHelper
  
  def authorise 
	unless signed_in?
		store_location
		redirect_to login_path, :notice=>"Please sign in to access this page."
	end
  end

private 
	def store_location
		session[:return_to] = request.fullpath
	end

	def set_last_seen_at
	  @current_user.update_attribute(:last_seen_at, Time.now)
	  session[:last_seen_at] = Time.now
	end

	def current_cart
		@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			@cart = Cart.new
			session[:cart_id] = @cart.id
	  end	
end