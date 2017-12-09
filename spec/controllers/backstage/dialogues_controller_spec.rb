require 'rails_helper'

RSpec.describe Backstage::DialoguesController, type: :controller do
  let(:dialogues) { (1..50).map { create(:dialogue) } }
  let(:dialogue) { dialogues.sample }

  describe 'GET #index' do
    subject { get :index }
    describe 'when logged in as admin' do
      before(:each) { sign_in create(:admin) }
      it 'should assigns @dialogues' do
        subject
        expect(assigns(:dialogues)).to eq(dialogues)
      end
      it 'should render index' do
        expect(subject).to render_template(:index)
      end
      it 'should return http status success' do
        expect(subject).to have_http_status(:success)
      end
    end
  end
end
