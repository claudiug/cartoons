class Character < ActiveRecord::Base
  belongs_to :cartoon
  has_and_belongs_to_many :episodes
  has_many :quotes
  has_many :comments, as: :commentable


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

  def cartoon_title
    cartoon.try(:title)
  end

  def cartoon_title=(title)
    self.cartoon = Cartoon.find_by(title: title) if title.present?
  end

  def self.get_all_quotes
    joins(:quotes).where.not(content: nil)
  end

  def get_quote_for_character(character)
    if character
      where(name: character).joins(quotes)
    end
  end



end
