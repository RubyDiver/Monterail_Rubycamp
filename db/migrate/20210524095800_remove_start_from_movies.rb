class RemoveStartFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :start, :time
  end
end
