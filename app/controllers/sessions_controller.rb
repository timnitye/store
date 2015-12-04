class SessionsController < ApplicationController
  def new
    @next_action = params[:next_action]
  	@user = User.new
  end

  # def create
  # 	# grab params
  # 	email = params[:user][:email]
  # 	password = params[:user][:password]
    
  #   # find user
  # 	@user = User.where(email: email).first

  # 	if @user && @user.password == password
  # 	# compare password to database password
	 #  binding.pry	
		# 	# if sucess go to product page
  #     session[:current_user_id] = @user.id
      
  #     binding.pry

  #     #if user has existing cart

  #     if @user.current_cart
  #       if session_cart
  #         db_cart = @user.current_cart
  #         db_cart.items << session_cart.items
  #         binding.pry
  #         db_cart.save
         
  #         session_cart.delete
  #         session[:cart_id] = db_cart.id
  #       else
  #         session[:cart_id] = @user.current_cart.id
  #       end
  #     else
  #       binding.pry
  #       session_cart.user = current_user if session_cart
  #       session_cart.save
  #     end
      
  #     if session_cart && session_cart.awaiting_user?
  #       binding.pry
  #       session_cart.assign_user!
  #       redirect_to session_cart.next_step
  #     else
  #       redirect_to products_url  
  #     end
  # 	else

  # 		# else send back to login and give warning
  # 		flash[:alert] = "Username or password is invalid. Please try again"
  # 		redirect_to signin_url

  # 	end
  # end

  def create
    # grab params
    email = params[:user][:email]
    password = params[:user][:password]
    
    # find user
    @user = User.where(email: email).first
    session[:current_user_id] = @user.id

    if @user && @user.password == password
      session_cart = Cart.find(session[:cart_id]) if session[:cart_id]
      #
      #
      # session_cart.merge_items! @user.current_cart if @user.has_open_cart? && session_cart
      # session_cart.user = @user if session_cart
      # session_cart = @user.current_cart if @user.has_open_cart?

      if @user.has_open_cart? && session_cart
        session_cart.user = @user
        session_cart.merge_items! @user.current_cart

      elsif session_cart
        session_cart.user = @user
      elsif @user.has_open_cart?
        session_cart = @user.current_cart

      end
      session_cart.save unless session_cart.nil?
      session[:cart_id] = session_cart.id if session_cart

      if session_cart && session_cart.awaiting_user?
        session_cart.assign_user!
        redirect_to session_cart.next_step
      else
        redirect_to products_url  
      end
    else

      # else send back to login and give warning
      flash[:alert] = "Username or password is invalid. Please try again"
      redirect_to signin_url

    end
  end

  def destroy
    #logout
    session.clear
    redirect_to root_url
  end

end
