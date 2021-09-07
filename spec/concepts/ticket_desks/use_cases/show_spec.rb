# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketDesks::UseCases::Show do
  let(:ticket_desk_1) { create :ticket_desk }
  let(:ticket_desk_2) { create :ticket_desk }
  let(:ticket_desk_3) { create :ticket_desk }

  let(:instance) { described_class.new.call(id: ticket_desk_1.id) }

  describe '.call' do
    it 'Show One Ticket Desk' do
      expect(instance).to eq(ticket_desk_1)
    end

    it 'return Cinema hall with proper values' do
      expect(instance).to have_attributes(
                            {
                              name: ticket_desk_1.name,
                              online: ticket_desk_1.online
                            }
                          )
    end
  end
end

