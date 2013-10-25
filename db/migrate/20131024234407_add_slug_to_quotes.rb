class AddSlugToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :slug, :string
    add_index :quotes, :slug
  end
end
