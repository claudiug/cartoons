class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :is_active, root: false
end
