class CreateUserTable < ActiveRecord::Migration[5.0]
  def change
    create_table :user do |t|
      t.string :name
      t.string :personality_id

      t.timestamps
  end
end
end
