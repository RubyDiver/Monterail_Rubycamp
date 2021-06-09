class TicketMailer < ApplicationMailer

  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to my site")
  end
end
