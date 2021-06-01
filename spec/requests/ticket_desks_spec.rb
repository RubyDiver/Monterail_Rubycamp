require 'rails_helper'

RSpec.describe "TicketDesks requests" do

  describe "GET /ticket_desks" do
    let!(:ticket_desks) { TicketDesk.create(name: "Some name", online: true) }
    it "works and return status 200" do
      get("/api/v1/ticket_desks")
      expect(response.status).to eq(200)
    end
  end

  describe "GET /ticket_desks/:id" do
    let!(:ticket_desks) { TicketDesk.create(name: "some name", online: true) }
    it "works and return status 200" do
      get("/api/v1/ticket_desks/#{ticket_desks.id}")
      expect(response.status).to eq(200)
    end
  end

  describe "POST /api/v1/ticket_desks" do
    it "works and return status 201" do
      post("/api/v1/ticket_desks", params: { ticket_desk: { name: "new name", online: true } })
      expect(response.status).to eq(201)
    end
  end

  describe "PUT /ticket_desks/:id" do
    let!(:ticket_desk) { TicketDesk.create(name: "Some name", online: true) }
    it "works and return status 200" do
      put("/api/v1/ticket_desks/#{ticket_desk.id}", params: { ticket_desk: { id: ticket_desk.id, name: "new name" } })
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /api/v1/ticket_desks/:id" do
    let!(:ticket_desk) { TicketDesk.create(name: "Some name", online: false ) }
    it "works and return status 200" do
      delete("/api/v1/ticket_desks/#{ticket_desk.id}", params: { id: ticket_desk.id })
      expect(response.status).to eq(200)
    end
  end
end