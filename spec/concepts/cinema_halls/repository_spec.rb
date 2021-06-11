require 'rails_helper'

RSpec.describe CinemaHalls::Repository do
  describe ".find_all" do
    let(:instance) { described_class.new }
    let!(:cinema_hall_1) { create :cinema_hall, created_at: Time.current - 6.minutes}
    let!(:cinema_hall_2) { create :cinema_hall, created_at: Time.current - 1.hours}
    let!(:cinema_hall_3) { create :cinema_hall, created_at: Time.current - 1.days}
    let!(:cinema_hall_4) { create :cinema_hall, created_at: Time.current - 3.days}

    it "return proper cinema halls" do
      expect(instance.find_all).to match_array([cinema_hall_1, cinema_hall_2, cinema_hall_3, cinema_hall_4])
    end
  end
end
