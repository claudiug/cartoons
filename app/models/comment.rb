class Comment < ActiveRecord::Base

  belongs_to :commentable, polymorphic: true
  validates :name, presence: true
  validates :email, presence: true
  validates :content, presence: true, length: {within: 4..300}
end
