require 'rails_helper'

RSpec.describe Reservation, type: :model do

  let!(:cinema_hall) { CinemaHall.create!(hall_name: "1", volume: 500) }
  let!(:movie) { Movie.create!(name: "Lorem", genre: "horror") }
  let!(:seance) { Seance.create!(start_time: '10:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id) }
  let!(:ticket_desk) { TicketDesk.create!(name: "pierwsza", online: true) }
  let!(:user) { User.create!(name: "Josh", age: 19, email: "josh@example.com", real_user: true) }
  let!(:reservation) { Reservation.create!(status: true, seance_id: seance.id, ticket_desk_id: ticket_desk.id, user_id: user.id) }

  it 'create reservation with valid and correct info' do
    expect(reservation).to be_valid
  end

  it 'create reservation not valid without status' do
    reservation.status = nil
    expect(reservation).not_to be_valid
  end

  it 'create reservation not valid without ticket desk id' do
    reservation.ticket_desk_id = nil
    expect(reservation).not_to be_valid
  end

  it 'create reservation not valid without user id' do
    reservation.user_id = nil
    expect(reservation).not_to be_valid
  end

  it 'create reservation not valid without seance id' do
    reservation.seance_id = nil
    expect(reservation).not_to be_valid
  end
end
