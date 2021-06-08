# frozen_string_literal: true

class RemoveTicketsIdFromCinemaHalls < ActiveRecord::Migration[6.1]
  def change
    remove_column :cinema_halls, :tickets_id, :bigint
  end
end
