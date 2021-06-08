# frozen_string_literal: true

class AddCinemaHallIdToSeance < ActiveRecord::Migration[6.1]
  def change
    add_reference :seances, :cinema_hall, null: false, foreign_key: true
  end
end
