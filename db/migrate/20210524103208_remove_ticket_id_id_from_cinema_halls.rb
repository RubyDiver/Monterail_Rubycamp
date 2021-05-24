class RemoveTicketIdIdFromCinemaHalls < ActiveRecord::Migration[6.1]
  def change
    remove_column :cinema_halls, :ticket_id_id, :bigint
  end
end
