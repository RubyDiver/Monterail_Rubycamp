# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CinemaHalls::Representers::OneCinemaHall do
  describe '.basic' do
    let(:cinema_hall) { create :cinema_hall }
    let(:instance) { described_class.new(cinema_hall) }

    it 'return proper hash' do
      expect(instance.basic).to eq(
        {
          id: cinema_hall.id,
          name: cinema_hall.hall_name,
          volume: cinema_hall.volume
        }
      )
    end
  end
end
