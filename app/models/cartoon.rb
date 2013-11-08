class Cartoon < ActiveRecord::Base
  has_many :episodes
  has_many :characters
  has_many :comments, as: :commentable
  validates :slug, uniqueness: true, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :created_by, presence: true
  validates :language, presence: true
  validates :country_of_origin, presence: true
  validates :no_of_episodes,  presence: true
  validates :no_of_seasons , presence: true, numericality: true
  validates :is_active, presence: true
  validates :slug, presence: true, uniqueness: true
  before_validation :generate_slug
  before_validation :make_title_titlecase

  def to_param
    slug
  end

  def generate_slug
    self.slug = title.try(:parameterize)
  end

  def make_title_titlecase
    self.title = title.try(:titlecase)
  end

  def no_of_episodes
    episodes.count
  end

  def self.by_title(q)
    if q.present?
      where("title like ?", "#{q}").order("created_at DESC")
    else
      none
    end
  end

  def count_characters
    if characters.nil?
      none
    else
     characters.count
    end
  end


  def cartoon_characters
    joins(:characters)
  end

  def self.find_characters(name)
    if name
      joins(:character).where(characters: {name: name})
    else
      none
    end
  end



end
