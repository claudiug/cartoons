require 'spec_helper'

describe 'Cartoon' do

  it 'is valid with: title,genre,description,created_by,language,country,episode,season,is_active,slug' do

    expect(build(:cartoon)).to be_valid

  end
  it 'is invalid with no title' do
    expect(build(:cartoon, title:nil)).to have(1).errors_on(:title)
  end
  it 'is invalid with no genre' do
    expect(build(:cartoon, genre:nil)).to have(1).errors_on(:genre)

  end
  it 'is invalid with no description'  do
    expect(build(:cartoon, description:nil)).to have(1).errors_on(:description)
  end
  it 'is invalid with no created_by' do
    expect(build(:cartoon, created_by:nil)).to have(1).errors_on(:created_by)
  end
  it 'is invalid with no language' do
    expect(build(:cartoon, language:nil)).to have(1).errors_on(:language)
  end
  it 'is invalid with no  country of origin' do
    expect(build(:cartoon, country_of_origin:nil)).to have(1).errors_on(:country_of_origin)
  end
  it 'is invalid with  no numbers of episode' do
    expect(build(:cartoon, no_of_episodes:nil)).to have(1).errors_on(:no_of_episodes)
  end
  it 'is invalid with no seasons' do
    expect(build(:cartoon, no_of_seasons:nil)).to have(1).errors_on(:no_of_seasons)
  end
  it 'is invalid with no is active' do
    expect(build(:cartoon, is_active:nil)).to have(1).errors_on(:is_active)
  end
  it 'is invalid with no slug' do
    expect(build(:cartoon, slug:nil)).to have(1).errors_on(:slug)
  end
  it 'is invalid with a duplicate slug'
  it 'is invalid with non numericality values for no of seasons'
  it 'is invalid with non numericality values for no of episodes'
  it 'has the name titlecase' do


    expect(build(:cartoon, title:'Futurama')).to eq 'Futurama'
  end
end