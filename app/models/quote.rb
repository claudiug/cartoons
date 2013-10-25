class Quote < ActiveRecord::Base
  belongs_to :character

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
end
