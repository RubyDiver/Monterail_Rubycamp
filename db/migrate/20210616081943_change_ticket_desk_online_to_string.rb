class ChangeTicketDeskOnlineToString < ActiveRecord::Migration[6.1]
  def change
    change_column :ticket_desks, :online, :string
  end
end
