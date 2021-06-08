# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      add_reference :ticket_desks, :tickets
      add_reference :cinema_halls, :tickets
      t.timestamps
    end
  end
end
