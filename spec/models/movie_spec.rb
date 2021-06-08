require 'rails_helper'

RSpec.describe Movie, type: :model do

  let!(:movie) {Movie.create(name: "Star Wars", genre: "horror")}

  it 'create movie with valid and correct info' do
    expect(movie).to be_valid
  end

  it 'create movie not valid without name' do
    movie.name = nil
    expect(movie).not_to be_valid
  end

  it 'create movie not valid without genre' do
    movie.genre = nil
    expect(movie).not_to be_valid
  end
end
