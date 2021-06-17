class ReservationConfirmMailer < ApplicationMailer

  def confirm_after_reservation
    email = params[:email]
    cinema_hall_id = params[:cinema_hall_id]
    movie_id = params[:movie_id]
    seat = params[:seat]
    text = "You have bought a ticket for movie id: #{movie_id} in cinema_hall #{cinema_hall_id} with seat taken #{seat}"
    mail(
      to: email,
      subject: 'MonteCinema Payment done') do |format|
      format.text { render html: text }
    end
  end
end
