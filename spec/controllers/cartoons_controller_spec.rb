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

  end
end