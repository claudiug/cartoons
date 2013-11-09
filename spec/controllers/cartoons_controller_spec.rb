require 'spec_helper'

describe CartoonsController do

  describe "GET index" do
    context "with params q" do
      it 'populate an array with that given letter' do
        get :index, q: 's'
        expect(response).to render_template :index
      end
      it 'renders the index views' do
        get :index, q: 's'
        expect(response).to render_template :index
      end
    end

    context 'without params q' do
      it 'populate an array with cartoons'do
        futurama = create(:cartoon, title: 'Futurama')
        american = create(:cartoon, title: 'American')
        get :index
        expect(assigns(:cartoons)).to match_array([futurama, american])
      end
      it 'render the index views' do
        get :index
        expect(response).to render_template :index
      end
    end

  end

  describe 'GET show' do
    it 'get the requested cartoon to @cartoon' do
      cartoon = create(:cartoon)
      get :show, id:cartoon
      expect(assigns(:cartoon)).to eq(cartoon)
    end

    it 'render the show view' do
      cartoon = create(:cartoon)
      get :show, id:cartoon
      expect(response).to render_template :show
    end
  end
end