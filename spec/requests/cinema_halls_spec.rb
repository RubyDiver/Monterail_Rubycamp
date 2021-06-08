# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CinemaHalls requests' do
  describe 'GET /cinema_halls' do
    let!(:cinema_hall) { CinemaHall.create(hall_name: 'Some name', volume: 500) }
    it 'works and return status 200' do
      get('/api/v1/cinema_halls')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /cinema_halls/:id' do
    let!(:cinema_hall) { CinemaHall.create(hall_name: 'Some name', volume: 500) }
    it 'works and return status 200' do
      get("/api/v1/cinema_halls/#{cinema_hall.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /api/v1/cinema_halls' do
    it 'works and return status 201' do
      post('/api/v1/cinema_halls', params: { cinema_hall: { hall_name: 'new name', volume: 100 } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /cinema_halls/:id' do
    let!(:cinema_hall) { CinemaHall.create(hall_name: 'S£ome name', volume: 500) }
    it 'works and return status 200' do
      put("/api/v1/cinema_halls/#{cinema_hall.id}",
          params: { cinema_hall: { id: cinema_hall.id, hall_name: 'new name' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /api/v1/cinema_halls/:id' do
    let!(:cinema_hall) { CinemaHall.create(hall_name: 'Some name', volume: 500) }
    it 'works and return status 204' do
      delete("/api/v1/cinema_halls/#{cinema_hall.id}", params: { id: cinema_hall.id })
      expect(response.status).to eq(204)
    end
  end
end
