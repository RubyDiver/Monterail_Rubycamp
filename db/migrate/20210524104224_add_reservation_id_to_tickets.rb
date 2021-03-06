# frozen_string_literal: true

class AddReservationIdToTickets < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :reservation, null: false, foreign_key: true
  end
end
