class SessionsController < ApplicationController
  def new
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
      SESSION[:current_user_id] = @user.id
      redirect_to products_url
  	else

  		# else send back to login and give warning
  		flash[:alert] = "Username or password is invalid. Please try again"
  		redirect_to signin_url

  	end
  end
end
