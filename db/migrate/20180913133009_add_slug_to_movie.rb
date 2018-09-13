class AddSlugToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :slug, :string
    add_column :actors, :slug, :string
    add_column :characters, :slug, :string
    add_column :directors, :slug, :string
    add_column :genres, :slug, :string
  end
end
