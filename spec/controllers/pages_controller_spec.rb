require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    before(:each) { get :index }

    it 'should render index' do
      expect(response).to render_template(:index)
    end
    it 'should return http status success' do
      expect(response).to have_http_status(:success)
    end
  end
end
