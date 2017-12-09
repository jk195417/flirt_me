require 'rails_helper'

RSpec.describe Backstage::PagesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }
    describe 'when logged in as admin' do
      it 'should render with layout backstage' do
        sign_in create(:admin)
        expect(subject).to have_http_status(:success)
        expect(subject).to render_template('layouts/backstage')
      end
    end

    describe 'when logged in as user' do
      it 'should raise CanCan::AccessDenied' do
        sign_in create(:user)
        expect { subject }.to raise_error(CanCan::AccessDenied)
      end
    end

    describe 'when logged in as guest' do
      it 'should raise CanCan::AccessDenied' do
        expect { subject }.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
