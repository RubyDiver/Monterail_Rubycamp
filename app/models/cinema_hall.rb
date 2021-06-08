# frozen_string_literal: true

class CinemaHall < ApplicationRecord
  has_many :seances
  validates_presence_of :hall_name, :volume
end
