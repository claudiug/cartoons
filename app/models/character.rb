class Character < ActiveRecord::Base
  belongs_to :cartoon
  has_and_belongs_to_many :episodes
  #TODO add validation
end
