# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketDesk, type: :model do
  let!(:ticket_desk) { TicketDesk.create(name: 'pierwsza', online: true) }

  it 'create ticket desk with valid and correct info' do
    expect(ticket_desk).to be_valid
  end

  it 'create ticket desk not valid without name' do
    ticket_desk.name = nil
    expect(ticket_desk).not_to be_valid
  end

  it 'create ticket desk not valid without online' do
    ticket_desk.online = nil
    expect(ticket_desk).not_to be_valid
  end
end
