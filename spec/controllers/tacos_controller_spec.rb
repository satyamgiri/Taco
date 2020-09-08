
require 'rails_helper'

RSpec.describe TacosController, type: :controller do

  # index action
  describe 'GET #index' do
    before do
      get :index
    end

    it 'assigns @tacos' do
      @tacos = Taco.all
      get :index
    end
  end

  # create action
  describe 'POST #create' do

    it 'creates a taco' do
      @taco = Taco.new
      post :create, params: 
      { taco: { meat: 'Steak', rice: 'true', salsa: 'true', guacamole: 'false', notes: '' } }
    end
  end
end
