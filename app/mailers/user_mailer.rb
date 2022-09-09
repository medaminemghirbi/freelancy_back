class UserMailer < ApplicationMailer
  default from: 'Freelancy@DevTeam.com'


  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.lastname} <#{user.email}>", :subject => "Registration Confirmation")
 end

 def forgot_password(user)
  @user = user
  @greeting = "Hi"
  
  mail to: user.email, :subject => 'Reset password instructions'
end
end
