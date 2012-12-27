class PasswordResetsController < ApplicationController
  skip_before_filter :authorize
  layout "sessions"
  def new

  if current_user 
  redirect_to root_path, :notice => "You are log in"
  end

  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to login_path, :notice => "Email sent with password reset instructions."
  end


  def edit
    @user = User.find_by_password_reset_token!(params[:id])

	rescue ActiveRecord::RecordNotFound => error 
      redirect_to new_password_reset_path, :alert => "Please generate reset link again"
  end


  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 24.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset link has expired."
    end

      if @user.update_attributes(params[:user])
	redirect_to login_path, :notice => "Password has been reset."
      else
        render :edit
      end


  end

end
