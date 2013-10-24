class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content
      t.integer :character_id

      t.timestamps
    end
  end
end
