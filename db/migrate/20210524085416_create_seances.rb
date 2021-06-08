# frozen_string_literal: true

class CreateSeances < ActiveRecord::Migration[6.1]
  def change
    create_table :seances, &:timestamps
  end
end
