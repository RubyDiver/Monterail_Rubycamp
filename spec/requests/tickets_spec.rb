require 'rails_helper'

RSpec.describe "Tickets requests" do

  @movie = Movie.create(name: "sadsd", genre: "horror")
  @cinema_hall = CinemaHall.create(hall_name: "pierwsza", volume: 400)
  @ticket_desk = TicketDesk.create(name: "Some name", online: true)
  @seance = Seance.create(start_time: "10:00", movie_id: @movie.id, cinema_hall_id: @cinema_hall.id)
  @reservation = Reservation.create(status: true, seance_id: @seance.id, ticket_desk_id: @ticket_desk.id)
  @ticket = Ticket.create(sort: "normal", price: 23, seat:23, reservation_id: @reservation.id)

  describe "GET /tickets" do
    it "returns status 200" do
      get("/api/v1/ticket_desks/#{@ticket_desk.id}/seances/#{@seance.id}/reservations/#{@reservation.id}/tickets")
      expect(response.status).to eq(200)
    end
  end
end