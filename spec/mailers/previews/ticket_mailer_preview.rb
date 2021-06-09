# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview
  TicketMailer.with(user: User.first).welcome_mail
end
