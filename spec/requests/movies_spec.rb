# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies requests' do
  describe 'GET /movies' do
    let!(:movies) { Movie.create(name: 'Some name', genre: 'horror') }
    it 'works and return status 200' do
      get('/api/v1/movies')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /movies/:id' do
    let!(:movies) { Movie.create(name: 'Some name', genre: 'horror') }
    it 'works and return status 200' do
      get("/api/v1/movies/#{movies.id}")
      expect(response.status).to eq(200)
    end
  end
end
