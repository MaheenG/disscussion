require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:discussions) }
    it { should have_many(:replies) }
  end

  describe '#admin?' do
    let(:admin) { create(:user, admin: true) }
    let(:user) { create(:user, admin: false) }

    it 'returns true for admin users' do
      expect(admin.admin?).to be true
    end

    it 'returns false for non-admin users' do
      expect(user.admin?).to be false
    end
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end
end 