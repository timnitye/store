class SessionsController < ApplicationController
  def new
    @next_action = params[:next_action]
  	@user = User.new
  end

  def create
  	# grab params
  	email = params[:user][:email]
  	password = params[:user][:password]
  	
  	# find user
  	@user = User.where(email: email).first

  	if @user && @user.password == password
  	# compare password to database password
	  	
			# if sucess go to product page
      session[:current_user_id] = @user.id

      associate_cart_with_user(@user)

      if next_action = params[:next_action]
        redirect_to next_action
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

  private 
  def associate_cart_with_user(user)
    if cart_id = session[:cart_id] 
      @cart = Cart.find(cart_id)
      @cart.user = user
      @cart.save
    end
  end
end
