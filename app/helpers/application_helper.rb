module ApplicationHelper
  def current_user_id
  	session[:current_user_id]
  end

  def current_user
  	@current_user ||= User.find(current_user_id) if current_user_id
  end

  # def cart
  # 	if session[:cart_id]
	 #  	@cart ||= Cart.find(session[:cart_id])
	 #  elsif session[:current_user_id]
	 #  	@cart ||= User.find(session[:current_user_id]).current_cart
	 #  end
  #   @cart
  # end

  def session_cart
      Cart.find(session[:cart_id]) if session[:cart_id]
  end

  # def session_cart=(cart)
  #   @session_cart = session[:cart_id] = cart.id
  # end

  def admin?
    current_user && current_user.has_role?('admin')
  end

end
