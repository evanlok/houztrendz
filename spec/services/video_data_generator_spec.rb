require 'rails_helper'

RSpec.describe VideoDataGenerator do
  let(:user) { build(:user) }
  let(:video) { build(:video, user: user, location: '94107') }
  let!(:core_logic_location_current) { create(:core_logic_location, zip_code: '94107', date: Date.parse('2015-11-1')) }
  let!(:core_logic_location_previous) { create(:core_logic_location, zip_code: '94107', date: Date.parse('2015-10-1')) }
  let(:video_data_generator) { described_class.new(video) }

  describe '#as_json' do
    it 'generates json for hal' do
      result = video_data_generator.as_json
      shared_attributes = core_logic_location_current.slice(*VideoDataGenerator::SHARED_ATTRIBUTES).symbolize_keys
      agent_attributes = user.attributes.slice(*VideoDataGenerator::AGENT_ATTRIBUTES).merge(photo: nil, broker_logo: nil).symbolize_keys
      stats = [
        core_logic_location_previous.attributes.slice(*VideoDataGenerator::STATS_ATTRIBUTES).symbolize_keys,
        core_logic_location_current.attributes.slice(*VideoDataGenerator::STATS_ATTRIBUTES).symbolize_keys
      ]

      expect(result).to include(shared_attributes)
      expect(result).to include(stats: stats)
      expect(result).to include(agent: agent_attributes)
    end

    context 'when location data does not exist' do
      let(:video) { build(:video, user: user, location: '12345') }

      it 'raises error' do
        expect { video_data_generator.as_json }.to raise_error(VideoDataGenerator::InsufficientDataError)
      end
    end
  end
end
