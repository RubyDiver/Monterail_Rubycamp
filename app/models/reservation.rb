class Reservation < ApplicationRecord
  has_many :tickets
  belongs_to :ticket_desk
  belongs_to :seance

  validates_presence_of :status
end
