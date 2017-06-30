class SessionsController < ApplicationController
  def login
  end

  def logout
    reset_session
    redirect_to :root
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/videos'
      else
        flash[:errors] = ["Password is incorrect"]
        redirect_to :back
      end
    else
      flash[:errors] = ["Email not found. Plese try again or register"]
      redirect_to :back
    end
  end
end
