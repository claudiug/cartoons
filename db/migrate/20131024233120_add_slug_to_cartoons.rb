class AddSlugToCartoons < ActiveRecord::Migration
  def change
    add_column :cartoons, :slug, :string
    add_index :cartoons, :slug
  end
end
