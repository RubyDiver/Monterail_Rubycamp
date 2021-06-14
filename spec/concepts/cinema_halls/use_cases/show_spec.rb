# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CinemaHalls::UseCases::Show do
  let(:cinema_hall_1) { create :cinema_hall }
  let(:cinema_hall_2) { create :cinema_hall }
  let(:cinema_hall_3) { create :cinema_hall }

  let(:instance) { described_class.new.call(id: cinema_hall_1.id) }

  describe '.call' do
    it 'Show One Cinema hall' do
      expect(instance).to eq(cinema_hall_1)
    end

    it 'return Cinema hall with proper values' do
      expect(instance).to have_attributes(
        {
          hall_name: cinema_hall_1.hall_name,
          volume: cinema_hall_1.volume
        }
      )
    end
  end
end
