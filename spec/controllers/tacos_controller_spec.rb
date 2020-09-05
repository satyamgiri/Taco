
require 'rails_helper'

RSpec.describe TacosController, type: :controller do

  # index action
  describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign taco instance variable' do
      expect(assigns[:tacos]).to eq(Taco.all)
    end
  end

  # create action
  describe 'POST #create' do
    before do
      post :create, params: params
    end

    context 'when params are correct' do

      it 'is expected to create new taco successfully' do
        expect(assigns[:taco]).to be_instance_of(Taco)
      end

      it 'is expected to have notes assigned to it' do
        expect(assigns[:taco].notes)
      end

      it 'is expected to redirect to tacos path' do
        is_expected.to redirect_to tacos_path
      end

      it 'is expected to set flash message' do
        expect(flash[:notice]).to eq('Taco Created Successfully.')
      end
    end

    context 'when params are not correct' do
      let(:params) { { taco: { notes: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end

      it 'is expected to add errors to notes attribute' do
        expect(assigns[:taco].errors[:notes]).to eq(['can\'t be blank'])
      end
    end
  end

end
