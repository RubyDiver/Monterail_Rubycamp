# frozen_string_literal: true

class AddNotAvailableToCinemaHall < ActiveRecord::Migration[6.1]
  def change
    add_column :cinema_halls, :not_available, :text, default: [], array: true
  end
end
