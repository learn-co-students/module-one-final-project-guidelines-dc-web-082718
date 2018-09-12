class CreateTables < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
    end
    create_table :albums do |t|
      t.string :name
      t.integer :year
      t.integer :artist_id

    end
      create_table :genres do |t|
        t.string :name
      # Consider adding sub-genres as seperate table
    end
      create_table :album_genres do |t|
        t.integer :album_id
        t.integer :genre_id

      end
  end
end
