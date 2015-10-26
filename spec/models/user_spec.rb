require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.from_onvedeo' do
    let(:email) { Faker::Internet.email }
    let(:auth_hash) do
      OpenStruct.new(
        info: OpenStruct.new(
          email: email,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          phone: Faker::PhoneNumber.cell_phone,
          description: Faker::Lorem.paragraph,
          bre_number: 'BRE1234',
        ),
        provider: 'Onvedeo',
        uid: '1234'
      )
    end

    it 'creates user from auth hash' do
      expect { User.from_onvedeo(auth_hash) }.to change(User, :count).by(1)
    end

    context 'for a user that already exists' do
      let!(:user) { create(:user, provider: 'Onvedeo', uid: '1234') }

      it 'returns existing user' do
        expect { User.from_onvedeo(auth_hash) }.to_not change(User, :count)
        expect(User.from_onvedeo(auth_hash)).to eq(user)
      end
    end
  end

  describe '#full_name' do
    let(:user) { build(:user) }

    it 'combines first and last name' do
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end
