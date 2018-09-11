class CreatePersonalityTable < ActiveRecord::Migration[5.0]
  def change
    create_table :personality do |t|
      t.string :type
      t.integer :name_id
      t.integer :meme_id

      t.timestamps

  end
end
end
