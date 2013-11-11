require 'spec_helper'

describe CharactersController do

  describe "GET index" do
    it 'renders the index template for all characters of a given cartoon' do
      cartoon = create(:cartoon)
      get :index, cartoon_id:cartoon.slug
      expect(response).to render_template :index
    end
  end

  describe 'GET show' do

    it 'render the show template for a character'do

      cartoon = create(:cartoon)
      character = create(:character)
      get :show, id:character, cartoon_id:cartoon.slug
      expect(response).to render_template :show
    end

  end

end