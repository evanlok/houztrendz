require 'rails_helper'

RSpec.describe HalVideoCallbacksController do
  describe 'GET create' do
    let!(:video) { create(:video, :new, hal_id: 123) }

    it 'updates video and returns success' do
      params = {
        id: 123,
        thumbnail_url: 'image.jpg',
        duration: 300,
        video_url_360: 'video.mp4',
        video_url_720: 'video_hd.mp4'
      }

      post :create, params
      expect(response).to be_success
      video.reload
      expect(video.thumbnail_url).to eq(params[:thumbnail_url])
      expect(video.duration).to eq(params[:duration])
      expect(video.url_sd).to eq(params[:video_url_360])
      expect(video.url_hd).to eq(params[:video_url_720])
    end

    context 'for a video that does not exist' do
      it 'renders not found' do
        post :create, id: 99999
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
