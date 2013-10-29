class Quote < ActiveRecord::Base
  belongs_to :character
  has_many :comments, as: :commentable

  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug
  before_validation :make_content_titlecase
  def to_param
    slug
  end

  def generate_slug
    self.slug ||= content.parameterize
  end

  def make_content_titlecase
    self.content = content.titlecase
  end

  def character_name
    character.try(:name)
  end

  def character_name=(name)
    self.character = Character.find_by(name: name) if name.present?
  end
end
