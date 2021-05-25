class Seance < ApplicationRecord
  belongs_to :cinema_hall
  belongs_to :movie
  has_many :reservations

  validates_presence_of :start_time
end
