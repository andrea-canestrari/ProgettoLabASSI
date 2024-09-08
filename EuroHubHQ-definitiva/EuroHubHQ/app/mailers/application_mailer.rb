class ApplicationMailer < ActionMailer::Base
  default from: "eurohubnoreply@example.com"
  layout "mailer"

  def welcome_email(user)
    @user = user
    @url  = "http://localhost:3000/users/sign_up"
    mail(:to => user.email,  subject: 'Welcome to My App!')
  end

  def password_reset_email(user, token)
    @resource = user
    @token = token
    mail(to: user.email, subject: 'Password Reset')
  end


end
