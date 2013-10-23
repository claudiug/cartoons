class AddEpisodesCharacters < ActiveRecord::Migration
  def change
    create_table :characters_episodes do |t|
      t.belongs_to :character
      t.belongs_to :episode
    end
  end
end
