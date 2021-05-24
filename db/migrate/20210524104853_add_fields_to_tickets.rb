class AddFieldsToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :type, :string
    add_column :tickets, :price, :integer
    add_column :tickets, :seat, :integer
  end
end
