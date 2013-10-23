class Episode < ActiveRecord::Base
  belongs_to :cartoon
  has_and_belongs_to_many :characters
end
