require 'rails_helper'

RSpec.describe TicketDesk, type: :model do
  before(:each) do
    @ticket_desk = TicketDesk.create(name: "pierwsza", online: true)
  end

  it 'create ticket desk with valid and correct info' do
    expect(@ticket_desk).to be_valid
  end
end
