# frozen_string_literal: true

class AddMovieIdToSeance < ActiveRecord::Migration[6.1]
  def change
    add_reference :seances, :movie, null: false, foreign_key: true
  end
end
