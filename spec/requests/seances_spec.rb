require "rails_helper"

RSpec.describe "Seances requests" do

  let!(:cinema_hall) { CinemaHall.create!(hall_name: "1", volume: 500) }
  let!(:movie) { Movie.create!(name: "Lorem", genre: "horror") }
  let!(:seance) { Seance.create!(start_time: '10:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id) }

  describe "GET seances" do
    it "returns status 200" do
      get("/api/v1/cinema_halls/#{cinema_hall.id}/seances")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /seances/:id" do
    before {seance}

    it "returns status 200" do
      get("/api/v1/cinema_halls/#{cinema_hall.id}/seances/#{seance.id}")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /seances" do
    it "returns status 201" do
      post("/api/v1/cinema_halls/#{cinema_hall.id}/seances",
           params: { seance: { start_time: '10:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id } } )
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /seances/:id" do
    it "returns status 200" do
      put("/api/v1/cinema_halls/#{cinema_hall.id}/seances/#{seance.id}",
          params: { seance: { start_time: '12:00', cinema_hall_id: cinema_hall.id, movie_id: movie.id } } )
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /seances/:id" do
    it "returns status 204" do
      delete("/api/v1/cinema_halls/#{cinema_hall.id}/seances/#{seance.id}")
      expect(response.status).to eq(204)
    end
  end
end
