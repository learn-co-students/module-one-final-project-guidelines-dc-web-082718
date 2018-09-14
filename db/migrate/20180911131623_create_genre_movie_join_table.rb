class CreateGenreMovieJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :genre_movie_join_tables do |t|
      t.integer :movie_id
      t.integer :genre_id
    end
  end
end
