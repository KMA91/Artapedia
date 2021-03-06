class UsersController < ApplicationController

  def register
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/videos'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
