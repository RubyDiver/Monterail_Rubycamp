require 'rails_helper'

RSpec.describe CinemaHalls::UseCases::Delete do
  let!(:cinema_hall) { create :cinema_hall }
  let(:instance) { described_class.new.call(id: cinema_hall.id) }

  describe ".call" do
    it "delete cinema hall record" do
      expect { instance }.to change { CinemaHall.count }.by(-1)
    end
  end
end

