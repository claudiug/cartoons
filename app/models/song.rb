class Song < ActiveRecord::Base
  belongs_to :episode
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
end
