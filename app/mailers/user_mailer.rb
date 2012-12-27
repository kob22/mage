class UserMailer < ActionMailer::Base

  default from: "kob2222@gmail.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Mag Password Reset"
  end
end
