require 'spec_helper'

describe 'Cartoon' do

  it 'is valid with: title,genre,description,created_by,language,country,episode,season,is_active,slug' do
    cartoon = Cartoon.new(
        title: 'futurama',
        genre: 'comic',
        description: 'a sf cartoon about the past',
        created_by: 'bender in the future',
        language: 'new en',
        country_of_origin: 'usa',
        no_of_seasons: '13',
        no_of_episodes: '139',
        is_active: true
    )
    expect(cartoon).to be_valid

  end
  it 'is invalid with no title'
  it 'is invalid with no genre'
  it 'is invalid with no description'
  it 'is invalid with no created_by'
  it 'is invalid with no language'
  it 'is invalid with no  country of origin'
  it 'is invalid with  no numbers of episode'
  it 'is invalid with no seasons'
  it 'is invalid with no is active'
  it 'is invalid with no slug'
  it 'is invalid with a duplicate slug'
  it 'is invalid with non numericality values for no of seasons'
  it 'is invalid with non numericality values for no of episodes'
end