class UserMailer < ActionMailer::Base
  default from: "noreply@deconfound.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = "http://deconfound.com/users/#{user.activation_token}/activate"

    mail to: user.email, subject: "Activate your Deconfound account"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url  = "http://deconfound.com/login"

    mail to: user.email, subject: "Welcome to Deconfound!"
  end
end
