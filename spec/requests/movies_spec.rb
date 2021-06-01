require "rails_helper"

RSpec.describe "Movies requests" do

  describe "GET /movies" do
    let!(:movies) { Movie.create(name: "Some name", genre: "horror") }
    it "works and return status 200" do
      get("/api/v1/movies")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /movies/:id" do
    let!(:movies) { Movie.create(name: "Some name", genre: "horror") }
    it "works and return status 200" do
      get("/api/v1/movies/#{movies.id}")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /api/v1/movies" do
    it "works and return status 201" do
      post("/api/v1/movies", params: { movie: { name: "new name", genre: "horror" } })
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /movies/:id" do
    let!(:movie) { Movie.create(name: "S£ome name", genre: "horror") }
    it "works and return status 200" do
      put("/api/v1/movies/#{movie.id}", params: { movie: { id: movie.id, name: "new name" } })
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /api/v1/movies/:id" do
    let!(:movie) { Movie.create(name: "Some name", genre: "horror") }
    it "works and return status 200" do
      delete("/api/v1/movies/#{movie.id}", params: { id: movie.id })
      expect(response.status).to eq(200)
    end
  end
end

