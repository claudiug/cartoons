class Character < ActiveRecord::Base
  belongs_to :cartoon
  has_and_belongs_to_many :episodes
  has_many :quotes
  #TODO add validation
end
