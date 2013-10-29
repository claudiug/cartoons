class Song < ActiveRecord::Base
  belongs_to :episode
  has_many :comments, as: :commentable

  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug
  before_validation :make_title_titlecase
  def to_param
    slug
  end

  def generate_slug
    self.slug ||= title.parameterize
  end

  def make_title_titlecase
    self.title=title.titlecase
  end

  def episode_name
    episode.try(:name)
  end

  def episode_name=(name)
    self.episode= Episode.find_by(name: name) if name.present?
  end
end
