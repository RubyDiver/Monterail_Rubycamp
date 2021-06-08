# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Seance, type: :model do
  let!(:cinema_hall) { CinemaHall.create!(hall_name: '1', volume: 500) }
  let!(:movie) { Movie.create!(name: 'Lorem', genre: 'horror') }
  let!(:seance) { Seance.create!(start_time: '10:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id) }

  it 'create seance with valid and correct info' do
    expect(seance).to be_valid
  end

  it 'create seance not walid without start_time' do
    seance.start_time = nil
    expect(seance).not_to be_valid
  end

  it 'create seance not valid without cinema hall id' do
    seance.cinema_hall_id = nil
    expect(seance).not_to be_valid
  end

  it 'create seance not valid without movie id' do
    seance.movie_id = nil
    expect(seance).not_to be_valid
  end
end
