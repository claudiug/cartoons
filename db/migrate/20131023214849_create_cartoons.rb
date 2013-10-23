class CreateCartoons < ActiveRecord::Migration
  def change
    create_table :cartoons do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.string :created_by
      t.string :language
      t.string :country_of_origin
      t.integer :no_of_seasons
      t.integer :no_of_episodes
      t.boolean :is_active
      t.timestamps
    end
  end
end
