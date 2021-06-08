# frozen_string_literal: true

class AddGenreToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :genre, :string
  end
end
