require 'rails_helper'

RSpec.describe CinemaHall, type: :model do

  before(:each) do
    @cinema_hall = CinemaHall.create(hall_name: "first", volume: 200)
  end

  it 'create cinema hall with valid and correct info' do
    expect(@cinema_hall).to be_valid
  end

  it 'create cinema hall not valid without hall name' do
    @cinema_hall.hall_name = nil
    expect(@cinema_hall).not_to be_valid
  end

  it 'create cinema hall not valid without volume' do
    @cinema_hall.volume = nil
    expect(@cinema_hall).not_to be_valid
  end
end
