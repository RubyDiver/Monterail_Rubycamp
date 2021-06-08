# frozen_string_literal: true

class AddUsersIdToReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
  end
end
