class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.boolean :real_user
      t.text :email

      t.timestamps
    end
  end
end
