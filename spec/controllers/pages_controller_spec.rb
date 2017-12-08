require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it 'should render index' do
      expect(subject).to render_template(:index)
    end
    it 'should return http status success' do
      expect(subject).to have_http_status(:success)
    end
  end
end
