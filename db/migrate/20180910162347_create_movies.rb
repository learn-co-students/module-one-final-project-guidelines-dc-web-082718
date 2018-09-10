class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :runtime
      t.date :release_date
      t.integer :tomatometer
    end
  end
end
