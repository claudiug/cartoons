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
  it 'is invalid with no title' do
    expect(Cartoon.new(title: nil)).to have(1).errors_on(:title)
  end
  it 'is invalid with no genre' do
    expect(Cartoon.new(genre: nil)).to have(1).errors_on(:genre)

  end
  it 'is invalid with no description'  do
    expect(Cartoon.new(description: nil)).to have(1).errors_on(:description)
  end
  it 'is invalid with no created_by' do
    expect(Cartoon.new(created_by: nil)).to have(1).errors_on(:created_by)
  end
  it 'is invalid with no language' do
    expect(Cartoon.new(language: nil)).to have(1).errors_on(:language)
  end
  it 'is invalid with no  country of origin' do
    expect(Cartoon.new(country_of_origin: nil)).to have(1).errors_on(:country_of_origin)
  end
  it 'is invalid with  no numbers of episode' do
    expect(Cartoon.new(no_of_episodes: nil)).to have(1).errors_on(:no_of_episodes)
  end
  it 'is invalid with no seasons' do
    expect(Cartoon.new(no_of_seasons: nil)).to have(1).errors_on(:no_of_seasons)
  end
  it 'is invalid with no is active' do
    expect(Cartoon.new(is_active: nil)).to have(1).errors_on(:is_active)
  end
  it 'is invalid with no slug' do
    expect(Cartoon.new(slug: nil)).to have(1).errors_on(:slug)
  end
  it 'is invalid with a duplicate slug'
  it 'is invalid with non numericality values for no of seasons'
  it 'is invalid with non numericality values for no of episodes'
  it 'has the name titlecase' do

    cartoon = Cartoon.new(
        title: 'futurama',
        genre: 'comic',
        description: 'a sf cartoon about the past',
        created_by: 'bender in the future',
        language: 'new en',
        country_of_origin: 'usa',
        no_of_seasons: '13',
        no_of_episodes: '139',
        is_active: true)
    expect(cartoon.title).to eq 'Futurama'
  end
end