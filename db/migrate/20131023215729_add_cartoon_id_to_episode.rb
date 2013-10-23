class AddCartoonIdToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :cartoon_id, :integer
  end
end
