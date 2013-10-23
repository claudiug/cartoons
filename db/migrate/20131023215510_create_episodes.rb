class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :name
      t.integer :episode_number
      t.integer :season_number
      t.string :guest_actors
      t.text :plot
      t.text :background
      t.text :review
      t.timestamps
    end
  end
end
