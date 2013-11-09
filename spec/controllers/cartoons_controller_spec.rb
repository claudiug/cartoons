require 'spec_helper'

describe CartoonsController do

  describe "GET index" do
    context "with params q" do
      it 'populate an array with that given letter'
      it 'renders the index views'
    end

    context 'without params q' do
      it 'populate an array with cartoons'
      it 'render the index views'
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