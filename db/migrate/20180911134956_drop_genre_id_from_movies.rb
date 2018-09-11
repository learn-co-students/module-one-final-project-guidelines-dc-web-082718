class DropGenreIdFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :genre_id
  end
end
