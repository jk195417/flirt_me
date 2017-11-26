require 'rails_helper'

RSpec.describe Backstage::PagesController, type: :controller do
  describe 'GET #index' do
    it 'if user is admin, then returns http success' do
      sign_in FactoryBot.create(:admin)
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'if user not admin, then raise CanCan::AccessDenied' do
      sign_in FactoryBot.create(:user)
      expect { get :index } .to raise_error(CanCan::AccessDenied)
    end
  end
end
