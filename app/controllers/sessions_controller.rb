class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		flash[:success] = "Bienvenido #{user.name}"
  		redirect_to root_path
  	else
  		flash[:error] = "Mal passsword"
  		render 'new'
  	end
  end

  def destroy
  	log_out 
  	redirect_to root_path, notice: "Loged Out!"
  	#self.current_user = nil
  	#session[:rakun].delete
  	#redirect_to root_url, flash[:notice] = "Chau!"
  end
end
