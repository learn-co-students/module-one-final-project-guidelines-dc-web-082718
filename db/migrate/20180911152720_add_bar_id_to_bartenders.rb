class AddBarIdToBartenders < ActiveRecord::Migration[5.0]
  def change
    add_column :bartenders, :bar_id, :integer
  end
end
