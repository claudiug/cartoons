class Episode < ActiveRecord::Base
  belongs_to :cartoon
  has_and_belongs_to_many :characters
  has_many :songs

  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug
  before_validation :make_name_titlecase
  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end

  def make_name_titlecase
    self.name = name.titlecase
  end
end
