# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let!(:cinema_hall) { CinemaHall.create!(hall_name: '1', volume: 500) }
  let!(:movie) { Movie.create!(name: 'Lorem', genre: 'horror') }
  let!(:seance) { Seance.create!(start_time: '10:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id) }
  let!(:user) { User.create!(name: 'Josh', age: 19, email: 'josh@example.com', real_user: true) }
  let!(:ticket_desk) { TicketDesk.create!(name: 'pierwsza', online: true) }
  let!(:reservation) do
    Reservation.create!(status: true, seance_id: seance.id, ticket_desk_id: ticket_desk.id, user_id: user.id)
  end
  let!(:ticket) { Ticket.create!(sort: 'Some name', price: 24, seat: 14, reservation_id: reservation.id) }

  it 'create ticket with valid and correct info' do
    expect(ticket).to be_valid
  end

  it 'create ticket not valid without sort' do
    ticket.sort = nil
    expect(ticket).not_to be_valid
  end

  it 'create ticket not valid without price' do
    ticket.price = nil
    expect(ticket).not_to be_valid
  end

  it 'create ticket not valid without seat' do
    ticket.seat = nil
    expect(ticket).not_to be_valid
  end

  it 'create ticket not valid without reservation id' do
    ticket.reservation_id = nil
    expect(ticket).not_to be_valid
  end

end
