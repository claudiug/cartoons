class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :description
      t.text :role
      t.string :first_appearance
      t.string :occupation
      t.string :spouse
      t.string :religion
      t.string :children
      t.timestamps
    end
  end
end
