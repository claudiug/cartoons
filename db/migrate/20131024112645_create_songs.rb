class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :link
      t.integer :episode_id

      t.timestamps
    end
  end
end
