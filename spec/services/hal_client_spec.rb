require 'rails_helper'

RSpec.describe HALClient do
  around do |example|
    ClimateControl.modify HOST: 'hal.onvedeo.com', WEB_PORT: '80', URI_SCHEME: 'http' do
      example.run
    end
  end

  let(:host) { 'http://hal.onvedeo.com' }
  let(:video) { create(:video, :new) }
  let(:hal_client) { HALClient.new(video) }

  describe '#generate' do
    let(:video_params) do
      {
        video_type: Theme::VIDEO_TYPE,
        definition: video.theme.class_name,
        data: {},
        callback_url: "#{host}/hal_video_callbacks",
        uid: video.id
      }.to_json
    end

    it 'sends post request to hal and updates video.hal_id' do
      expect_any_instance_of(VideoDataGenerator).to receive(:as_json) { {} }
      stub = stub_request(:post, "#{host}/api/v1/video_contents").
        with(body: video_params, headers: { 'Content-Type' => 'application/json' }).
        to_return(body: { id: 333 }.to_json)

      hal_client.generate
      expect(stub).to have_been_requested
      expect(video.reload.hal_id).to eq(333.to_s)
    end
  end

  describe '#info' do
    let(:video) { create(:video) }

    it 'fetches video info from hal' do
      stub = stub_request(:get, "#{host}/api/v1/video_contents/#{video.hal_id}").
        with(headers: { 'Content-Type' => 'application/json' }).
        to_return(body: { id: 333 }.to_json)

      hal_client.info
      expect(stub).to have_been_requested
    end

    context 'when video is not generated' do
      let(:video) { create(:video, :new) }

      it 'raises exception' do
        expect { hal_client.info }.to raise_error(StandardError)
      end
    end
  end
end
