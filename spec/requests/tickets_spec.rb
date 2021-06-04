require 'rails_helper'

RSpec.describe "Tickets requests" do
  let!(:cinema_hall) { CinemaHall.create!(hall_name: "1", volume: 500) }
  let!(:movie) { Movie.create!(name: "Lorem", genre: "horror") }
  let!(:seance) { Seance.create!(start_time: '10:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id) }
  let!(:user) { User.create!(name: "Josh", age: 19, email: "josh@example.com", real_user: true) }
  let!(:ticket_desk) { TicketDesk.create!(name: "pierwsza", online: true) }
  let!(:reservation) { Reservation.create!(status: true, seance_id: seance.id, ticket_desk_id: ticket_desk.id, user_id: user.id) }
  let!(:ticket) { Ticket.create!(sort: "Some name", price: 24, seat: 14,
                                 reservation_id: reservation.id) }

  describe "GET /tickets" do
    it "works and return status 200" do
      get("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/#{reservation.id}/tickets")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /ticket_desks/:id" do
    it "works and return status 200" do
      get("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/#{reservation.id}/tickets")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /api/v1/ticket_desks" do
    it "works and return status 201" do
      post("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/#{reservation.id}/tickets",
           params: { ticket: { sort: "new name", price: 24, seat: 14, reservation_id: reservation.id} })
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /ticket_desks/:id" do
    it "works and return status 200" do
      put("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/#{reservation.id}/tickets/#{ticket.id}",
          params: { ticket: { sort: "normal", price: 24, seat: 14 } })
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /api/v1/ticket_desks/:id" do
    let!(:ticket_desk) { TicketDesk.create(name: "Some name", online: false) }
    it "works and return status 204" do
      delete("/api/v1/ticket_desks/#{ticket_desk.id}", params: { id: ticket_desk.id })
      expect(response.status).to eq(204)
    end
  end
end