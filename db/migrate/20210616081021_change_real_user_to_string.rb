class ChangeRealUserToString < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :real_user, :string
  end
end
