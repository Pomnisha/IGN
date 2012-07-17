#encoding: utf-8
class UserMailer < ActionMailer::Base
  default :from => "admin@ign.su"
  def signup_notification(user)
    @user = user
    mail(:to => user.email, :subject => "Регистрация на IGN")
  end
end
