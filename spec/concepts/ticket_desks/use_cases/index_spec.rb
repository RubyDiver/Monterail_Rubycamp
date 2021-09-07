require 'rails_helper'

RSpec.describe TicketDesks::UseCases::Index do
  let(:ticket_desk_1) { create :ticket_desk }
  let(:ticket_desk_2) { create :ticket_desk }
  let(:ticket_desk_3) { create :ticket_desk }

  let(:instance) { described_class.new.call }

  describe '.call' do
    it 'Show All Ticket Desks' do
      expect(instance).to eq([ticket_desk_1, ticket_desk_2, ticket_desk_3])
    end

    it 'return Ticket desks with proper values' do
      expect(instance.last).to eq(TicketDesk.last)
    end
  end
end

