class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to companies_path, notice: "Welcome back, #{user.username}!"
    else
      flash.now[:alert] = "Username or password is incorrect. Please try again."
      render :new
    end    
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "Goodbye!"
  end
    
end
