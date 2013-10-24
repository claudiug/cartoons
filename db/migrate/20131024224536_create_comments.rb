class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
