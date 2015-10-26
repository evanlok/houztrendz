require 'rails_helper'

RSpec.describe UserPolicy do
  let(:user) { User.new }
  subject { described_class }

  permissions :update? do
    it 'grants access if users are the same' do
      expect(subject).to permit(user, user)
    end

    it 'denies access if users are different' do
      expect(subject).to_not permit(user, User.new)
    end
  end
end
