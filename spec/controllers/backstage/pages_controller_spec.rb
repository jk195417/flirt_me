require 'rails_helper'

RSpec.describe Backstage::PagesController, type: :controller do
  describe 'GET #index' do
    context 'when logged in as admin' do
      it 'should return http status success' do
        sign_in create(:admin)
        get :index
        expect(response).to have_http_status(:success)
      end
    end
    context 'when logged in as user' do
      it 'should raise CanCan::AccessDenied' do
        sign_in create(:user)
        expect { get :index } .to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
