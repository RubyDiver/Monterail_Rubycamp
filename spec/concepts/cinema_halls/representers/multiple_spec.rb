# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CinemaHalls::Representers::AllCinemaHalls do
  describe '.basic' do
    let(:cinema_hall_1) { create :cinema_hall }
    let(:cinema_hall_2) { create :cinema_hall }
    let(:cinema_halls) { [cinema_hall_1, cinema_hall_2] }
    let(:instance) { described_class.new(cinema_halls) }

    it 'return proper hash' do
      expect(instance.basic).to eq(
        [
          {
            id: cinema_hall_1.id,
            name: cinema_hall_1.hall_name,
            volume: cinema_hall_1.volume
          },
          {
            id: cinema_hall_2.id,
            name: cinema_hall_2.hall_name,
            volume: cinema_hall_2.volume
          }
        ]
      )
    end
  end
end
