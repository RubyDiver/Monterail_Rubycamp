require 'rails_helper'

RSpec.describe CinemaHalls::UseCases::Create do
  let(:instance) { described_class.new }
  let(:params) do
    {
      hall_name: "first",
      volume: 123
    }
  end

  subject { instance.call(params: params) }

  describe ".call" do
    it "create cinema hall record" do
      expect { subject }.to change { CinemaHall.count }.by(1)
    end

    it "return cinema hall" do
      expect(subject).to be_a_kind_of(CinemaHall)
    end

    it "return Cinema hall with proper values" do
      expect( subject ).to have_attributes(params)
    end
  end
end
