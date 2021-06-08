# frozen_string_literal: true

class ChangeTicketsTypeToSort < ActiveRecord::Migration[6.1]
  def change
    rename_column :tickets, :type, :sort
  end
end
