class AddExpiresAtToReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :expires_at, :datetime
  end
end
