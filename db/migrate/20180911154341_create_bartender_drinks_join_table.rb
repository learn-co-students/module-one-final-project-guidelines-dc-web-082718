class CreateBartenderDrinksJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bartender_drinks do |t|
      t.integer :bartender_id
      t.integer :drink_id

      t.timestamps null: false
    end
  end
end
