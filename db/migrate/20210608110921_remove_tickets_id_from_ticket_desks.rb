# frozen_string_literal: true

class RemoveTicketsIdFromTicketDesks < ActiveRecord::Migration[6.1]
  def change
    remove_column :ticket_desks, :tickets_id, :bigint
  end
end
