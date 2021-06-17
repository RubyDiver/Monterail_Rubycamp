# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '`Reservations` requests' do
  let!(:cinema_hall) { CinemaHall.create!(hall_name: '1', volume: 500) }
  let!(:movie) { Movie.create!(name: 'Lorem', genre: 'horror') }
  let!(:seance) { Seance.create!(start_time: '10:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id) }
  let!(:ticket_desk) { TicketDesk.create!(name: 'pierwsza', online: true) }
  let!(:user) { User.create!(name: 'Josh', age: 19, email: 'josh@example.com', real_user: "true") }
  let!(:reservation) do
    Reservation.create!(status: true, seance_id: seance.id, ticket_desk_id: ticket_desk.id, user_id: user.id)
  end

  describe 'GET /reservations' do
    it 'returns status 200' do
      get("/api/v1/ticket_desks/#{ticket_desk.id}/reservations")
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /reservations/:id' do
    it 'returns status 200' do
      get("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/#{reservation.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /reservations' do
    it 'returns status 201' do
      post("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/online",
           params: { reservation: { status: "true", seance_id: seance.id, ticket_desk_id: ticket_desk.id,
                                    user_id: user.id, expires_at: (Time.now + 40.minutes) } })

      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /reservations/:id' do
    it 'returns status 200' do
      put("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/#{reservation.id}",
          params: { reservation: { status: true, seance_id: seance.id, ticket_desk_id: ticket_desk.id } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /reservations/:id' do
    it 'returns status 204' do
      delete("/api/v1/ticket_desks/#{ticket_desk.id}/reservations/#{reservation.id}")
      expect(response.status).to eq(204)
    end
  end
end
