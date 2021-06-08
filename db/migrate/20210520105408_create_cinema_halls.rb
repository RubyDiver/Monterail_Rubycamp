# frozen_string_literal: true

class CreateCinemaHalls < ActiveRecord::Migration[6.1]
  def change
    create_table :cinema_halls do |t|
      t.string :hall_name
      t.integer :volume

      t.timestamps
    end
  end
end
