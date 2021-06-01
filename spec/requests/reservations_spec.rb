require "rails_helper"

RSpec.describe "`Reservations` requests" do

  @movie = Movie.create(name: "sadsd", genre: "horror")
  @cinema_hall = CinemaHall.create(hall_name: "pierwsza", volume: 400)
  @seance = Seance.create(start_time: "10:00", movie_id: @movie.id, cinema_hall_id: @cinema_hall.id)
  @ticket_desk = TicketDesk.create(name: "Some name", online: true)
  @reservation = Reservation.create(status: true, seance_id: @seance.id, ticket_desk_id: @ticket_desk.id)

  describe "GET /reservations" do
    it "returns status 200" do
      get("/api/v1/ticket_desks/#{@ticket_desk.id}/seances/#{@seance.id}/reservations")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /reservations/:id" do
    it "returns status 200" do
      get("/api/v1/ticket_desks/#{@ticket_desk.id}/seances/#{@seance.id}/reservations/#{reservation.id}")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /reservations" do
    it "returns status 201" do
            post("/api/v1/ticket_desks/#{@ticket_desk.id}/seances/#{@seance.id}/reservations",
           params: { reservation: {  status: true, seance_id: seance.id, ticket_desk_id: ticket_desk.id } } )
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /reservations/:id" do
    it "returns status 200" do
      put("/api/v1/ticket_desks/#{@ticket_desk.id}/seances/#{@seance.id}/reservations/#{reservation.id}",
          params: { reservation: { status: true, seance_id: seance.id, ticket_desk_id: ticket_desk.id } })
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /reservations/:id" do
    it "returns status 204" do
      delete("/api/v1/ticket_desks/#{@ticket_desk.id}/seances/#{@seance.id}/reservations/#{reservation.id}")
      expect(response.status).to eq(204)
    end
  end
end
