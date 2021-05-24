class RemoveTicketIdIdFromTicketDesks < ActiveRecord::Migration[6.1]
  def change
    remove_column :ticket_desks, :ticket_id_id, :bigint
  end
end
