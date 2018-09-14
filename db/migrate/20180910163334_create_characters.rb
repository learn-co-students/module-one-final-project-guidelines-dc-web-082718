class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :actor_id
      t.integer :movie_id
    end
  end
end
