# frozen_string_literal: true

class TicketDesk < ApplicationRecord
  has_many :reservations

  validates_presence_of :name
end
