class SessionsController < ApplicationController
  def new    
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name]= user.name
      redirect_to root_path, notice: "Welcome back, #{session[:user_name]}!"
    else
      render 'new'
      flash[:alert]= "Wrong credentials"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_path, notice: "Logged out. See you!"
  end

end
