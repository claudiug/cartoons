class AddIndexToComment < ActiveRecord::Migration
  def change
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:name]
  end
end
