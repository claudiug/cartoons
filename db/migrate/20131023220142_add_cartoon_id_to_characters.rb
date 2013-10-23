class AddCartoonIdToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :cartoon_id, :integer
  end
end
