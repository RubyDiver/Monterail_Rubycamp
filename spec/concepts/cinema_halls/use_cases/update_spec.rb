# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CinemaHalls::UseCases::Update do
  let(:cinema_hall) { create :cinema_hall }
  let(:params) do
    {
      hall_name: 'updated hall name',
      volume: 133
    }
  end
  let(:instance) { described_class.new.call(id: cinema_hall.id, params: params) }
  # subject { instance.call(id: cinema_hall.id, params: params) }

  describe '.call' do
    it 'Update Cinema Hall' do
      expect { instance }
        .to change { cinema_hall.reload.hall_name }.to('updated hall name')
                                                   .and change { cinema_hall.reload.volume }.to(133)
    end

    it 'Return Cinema hall' do
      expect(instance).to eq(cinema_hall)
    end
  end
end
