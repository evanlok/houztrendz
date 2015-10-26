require 'rails_helper'

RSpec.describe VideoPolicy do
  let(:user) { User.new }
  subject { described_class }

  permissions :create? do
    it 'grants access if video belongs to user' do
      expect(subject).to permit(user, Video.new(user: user))
    end

    it 'denies access if video does not belong to user' do
      expect(subject).to_not permit(user, Video.new)
    end
  end
end
