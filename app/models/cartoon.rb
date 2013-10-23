class Cartoon < ActiveRecord::Base
  has_many :episodes
  has_many :characters
  #TODO add validation
end
