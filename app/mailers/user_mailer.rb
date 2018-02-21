class UserMailer < ApplicationMailer
  default from: 'app@sengaa.com'

  def login_token(user)
    @login_token = user.login_token
    mail(to: user.email, subject: 'sengaa login request')
  end
end
