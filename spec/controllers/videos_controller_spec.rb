require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  login_user

  describe 'GET new' do
    let!(:theme) { create(:theme) }

    it 'renders page' do
      get :new
      expect(response).to be_success
      expect(assigns(:video)).to be_present
      expect(assigns(:themes)).to be_present
    end
  end

  describe 'POST create' do
    let!(:theme) { create(:theme) }

    it 'creates a new video and generates it' do
      expect_any_instance_of(Video).to receive(:generate)
      post :create, video: { theme_id: theme.id, location: '94102', background_color: '#fff' }
      expect(response).to redirect_to(current_profile_url)
    end

    context 'with invalid params' do
      it 'renders new' do
        post :create, video: { location: '94102' }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET show' do
    let(:core_logic_location) { create(:core_logic_location) }
    let(:video) { create(:video, location: core_logic_location.zip_code) }

    it 'renders page' do
      get :show, id: video
      expect(response).to be_success
      expect(assigns(:core_logic_location)).to be_present
    end
  end

  describe 'DELETE destroy' do
    let(:video) { create(:video, user: user) }

    it 'deletes video' do
      delete :destroy, id: video
      expect(Video.where(id: video.id).exists?).to be false
      expect(response).to redirect_to(current_profile_url)
    end
  end
end
