class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  private 
    def curr_user
      if session[:user_id]
        User.find(session[:user_id])
      end
    end

    helper_method :curr_user

  def require_login
    redirect_to '' unless session[:user_id]
  end

end
