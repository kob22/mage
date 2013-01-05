class SessionsController < ApplicationController
  skip_before_filter :authorize
  layout "sessions"

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies[:auth_token] = {value: user.auth_token, expires: 7.days.from_now.utc}
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to login_path, :notice => "Logged out!"
  end
end
