require 'rails_helper'

RSpec.describe DialoguesController, type: :controller do
  let(:dialogues) { (1..50).map { create(:dialogue) } }
  let(:dialogue) { dialogues.sample }

  describe 'GET #index' do
    before(:each) { get :index }

    it 'should assigns @dialogues' do
      expect(assigns(:dialogues)).to eq(dialogues)
    end
    it 'should render index' do
      expect(response).to render_template(:index)
    end
    it 'should return http status success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before(:each) { get :show, params: { id: dialogue.id } }

    it 'should assign @dialogue' do
      expect(assigns(:dialogue)).to eq(dialogue)
    end
    it 'should render show' do
      expect(response).to render_template(:show)
    end
    it 'should return http status success' do
      expect(response).to have_http_status(:success)
    end
  end
end
