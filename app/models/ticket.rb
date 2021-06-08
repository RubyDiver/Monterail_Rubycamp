# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :reservation

  validates_presence_of :price, :sort, :seat
end
