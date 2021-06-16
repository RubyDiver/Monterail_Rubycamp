# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
CinemaHall.destroy_all
Seance.destroy_all
User.destroy_all
TicketDesk.destroy_all
Reservation.destroy_all
Ticket.destroy_all

require 'faker'

cinema_hall_1 = CinemaHall.create(
  id: 1,
  hall_name: 'cinema hall 1',
  volume: 100,
  not_available: %w[A6 A7 B6 B7],
  seats: CinemaHalls::UseCases::GenerateSeats.new(params: { rows: %w[A H], columns: [1, 13] }).call
)
cinema_hall_2 = CinemaHall.create(
  id: 2,
  hall_name: 'cinema hall 2',
  volume: 50,
  not_available: %w[A1 A4 A5 A6 B4 B5 B6 C4 C5 C6],
  seats: CinemaHalls::UseCases::GenerateSeats.new(params: { rows: %w[A F], columns: [1, 10] }).call
)
cinema_hall_3 = CinemaHall.create(
  id: 3,
  hall_name: 'cinema hall 3',
  volume: 100,
  not_available: %w[A6 A7 B6 B7],
  seats: CinemaHalls::UseCases::GenerateSeats.new(params: { rows: %w[A H], columns: [1, 13] }).call
)
cinema_hall_4 = CinemaHall.create(
  id: 4,
  hall_name: 'cinema hall 4',
  volume: 25,
  not_available: %w[A3 A4 A5 B3 B4 B5 C3 C4 C5 E7],
  seats: CinemaHalls::UseCases::GenerateSeats.new(params: { rows: %w[A E], columns: [1, 7] }).call
)

movie_1 = Movie.create(id: 1, name: 'Lord of the rings', genre: 'fantasy')
movie_2 = Movie.create(id: 2, name: 'Sing', genre: 'comedy')
movie_3 = Movie.create(id: 3, name: 'IT', genre: 'horror')
movie_4 = Movie.create(id: 4, name: "Crud's", genre: 'Family')

seance_1 = Seance.create(
  id: 1,
  start_time: Time.current + 2.days,
  cinema_hall_id: cinema_hall_1.id,
  movie_id: movie_1.id
)
seance_2 = Seance.create(
  id: 2,
  start_time: Time.current + 4.hours,
  cinema_hall_id: cinema_hall_2.id,
  movie_id: movie_2.id
)
seance_3 = Seance.create(
  id: 3,
  start_time: Time.current + 2.hours,
  cinema_hall_id: cinema_hall_3.id,
  movie_id: movie_3.id
)
seance_4 = Seance.create(
  id: 4,
  start_time: Time.current + 6.hours,
  cinema_hall_id: cinema_hall_4.id,
  movie_id: movie_4.id
)

user_1 = User.create(id: 1, email: 'montecinema@gmail.com', name: 'Monterail', age: 18, real_user: false)
user_2 = User.create(id: 2, email: 'paweltatr@gmail.com', name: 'Pawel', age: 25, real_user: true)
user_3 = User.create(id: 3, email: 'marekwojtkiewicz@gmail.com', name: 'Mare', age: 15, real_user: true)
user_4 = User.create(id: 4, email: 'karojako@gmail.com', name: 'Karolina', age: 37, real_user: true)

ticket_desk_1 = TicketDesk.create(id: 1, online: true, name: "Pierwsza")
ticket_desk_2 = TicketDesk.create(id: 2, online: true, name: "Druga")
ticket_desk_3 = TicketDesk.create(id: 3, online: false, name: "Trzecia")

Reservations::UseCases::CreateOffline.new(
  params: {
    ticket_desk_id: ticket_desk_2.id,
    seance_id: seance_1.id,
    tickets: [
      { price: 25, sort: 'normal', seat: 'A1' },
      { price: 25, sort: 'normal', seat: 'A2' },
      { price: 25, sort: 'normal', seat: 'A3' },
      { price: 15, sort: 'child', seat: 'B1' },
      { price: 15, sort: 'child', seat: 'B1' }
    ]
  }
).call

Reservations::UseCases::CreateOffline.new(
  params: {
    ticket_desk_id: ticket_desk_3.id,
    seance_id: seance_1.id,
    tickets: [
      { price: 25, sort: 'normal', seat: 'D1' },
      { price: 25, sort: 'normal', seat: 'D2' },
      { price: 25, sort: 'normal', seat: 'D3' },
    ]
  }
).call

Reservations::UseCases::CreateOffline.new(
  params: {
    ticket_desk_id: ticket_desk_3.id,
    seance_id: seance_2.id,
    tickets: [
      { price: 15, sort: 'student', seat: 'D1' },
      { price: 15, sort: 'normal', seat: 'D1' },
    ]
  }
).call

Reservations::UseCases::CreateOnline.new(
  params: {
    seance_id: seance_1.id,
    user_id: user_3.id,
    tickets: [
      { price: 20, sort: 'student', seat: 'E1' },
      { price: 20, sort: 'normal', seat: 'E2' },
      { price: 20, sort: 'student', seat: 'E3' }
    ]
  }
).call

Reservations::UseCases::CreateOnline.new(
  params: {
    seance_id: seance_2.id,
    user_id: user_2.id,
    tickets: [
      { price: 25, sort: 'normal', seat: 'B1' },
      { price: 25, sort: 'normal', seat: 'B3' },
      { price: 15, sort: 'child', seat: 'B10' }
    ]
  }
).call