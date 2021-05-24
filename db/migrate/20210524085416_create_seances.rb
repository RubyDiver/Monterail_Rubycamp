class CreateSeances < ActiveRecord::Migration[6.1]
  def change
    create_table :seances do |t|

      t.timestamps
    end
  end
end
