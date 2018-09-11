class CreatePersonalityTable < ActiveRecord::Migration[5.0]
  def change
    create_table :personalities do |t|
      t.string :name
      t.integer :name_id
      t.integer :meme_id

      t.timestamps

  end
end
end
