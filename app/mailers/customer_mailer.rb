class UserMailer < ApplicationMailer
  
  @user = user
  mailer to: user.email, subject: "件名が入る"
  
end