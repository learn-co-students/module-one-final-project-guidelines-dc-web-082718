class AddDirectorRatingWriterStudioGenreToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :director_id, :integer
    add_column :movies, :writer, :string
    add_column :movies, :studio, :string
    add_column :movies, :genre_id, :integer
    add_column :movies, :rating, :string
  end
end
