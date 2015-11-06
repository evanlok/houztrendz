require 'rails_helper'

RSpec.describe Video, type: :model do
  describe '#core_logic_location' do
    let(:core_logic_location) { create(:core_logic_location) }
    let(:video) { build(:video, location: core_logic_location.zip_code) }

    it 'fetches CoreLogicLocation record' do
      expect(video.core_logic_location).to eq(core_logic_location)
    end
  end

  describe '#generate' do
    let(:video) { build(:video) }

    it 'calls generate on HALClient' do
      expect_any_instance_of(HALClient).to receive(:generate)
      video.generate
    end
  end
end
