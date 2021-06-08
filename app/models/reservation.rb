# frozen_string_literal: true

class Reservation < ApplicationRecord
  has_many :tickets
  belongs_to :ticket_desk
  belongs_to :seance
  belongs_to :user

  validates_presence_of :status
end
