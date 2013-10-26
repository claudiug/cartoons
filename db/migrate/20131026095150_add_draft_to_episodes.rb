class AddDraftToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :draft, :boolean
  end
end
