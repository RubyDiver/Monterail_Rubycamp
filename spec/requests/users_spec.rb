# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users requests' do
  let!(:user) { User.create(name: 'Some name', age: 500, real_user: true, email: "pawel@example.com") }

  describe 'GET /user' do
    it 'works and return status 200' do
      get('/api/v1/users')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /users/:id' do
    it 'works and return status 200' do
      get("/api/v1/users/#{user.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /api/v1/users' do
    it 'works and return status 201' do
      post('/api/v1/users', params: { user: { name: 'Some name', age: 500, real_user: true, email: "pawel@example.com" } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /users/:id' do
    it 'works and return status 200' do
      put("/api/v1/users/#{user.id}",
          params: { user: { id: user.id, name: 'new name' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /api/v1/users/:id' do
    it 'works and return status 204' do
      delete("/api/v1/users/#{user.id}", params: { id: user.id })
      expect(response.status).to eq(204)
    end
  end
end

