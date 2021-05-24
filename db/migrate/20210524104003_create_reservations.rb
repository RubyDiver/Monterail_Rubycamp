class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :ticket_desk
      t.references :seance
      t.boolean :status

      t.timestamps
    end
  end
end
