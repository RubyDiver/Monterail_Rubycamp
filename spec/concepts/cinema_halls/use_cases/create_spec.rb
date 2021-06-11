require 'rails_helper'

RSpec.describe CinemaHalls::UseCases::Create do
  let(:instance) { described_class.new.call(params: params) }
  let(:params) do
    {
      hall_name: "first",
      volume: 123
    }
  end

  describe ".call" do
    it "create cinema hall record" do
      expect { instance }.to change { CinemaHall.count }.by(1)
    end

    it "return cinema hall" do
      expect(instance).to be_a_kind_of(CinemaHall)
    end

    it "return Cinema hall with proper values" do
      expect(instance).to have_attributes(params)
    end
  end
end
