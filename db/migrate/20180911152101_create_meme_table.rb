class CreateMemeTable < ActiveRecord::Migration[5.0]
  def change
    create_table :memes do |t|
    t.string :name
    t.string :url
    t.integer :personality_id

    t.timestamps
  end
end
end
