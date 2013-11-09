FactoryGirl.define do
  factory :episode do
    name "pilot"
    episode_number 12
    season_number 2
    quest_actors "one"
    plot "some cool text here for reading"
    background "was at night"
    review "not at night"
    draft false


  end
end