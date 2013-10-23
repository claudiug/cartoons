class Cartoon < ActiveRecord::Base
  has_many :episodes
  has_many :characters
end
