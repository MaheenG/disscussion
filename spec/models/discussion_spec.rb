require 'rails_helper'

RSpec.describe Discussion, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:channel) }
    it { should have_many(:replies).dependent(:destroy) }
  end

  describe 'friendly_id' do
    let(:discussion) { create(:discussion, title: 'Test Discussion') }

    it 'generates a slug from the title' do
      expect(discussion.slug).to eq('test-discussion')
    end

    it 'generates unique slugs for discussions with the same title' do
      discussion1 = create(:discussion, title: 'Same Title')
      discussion2 = create(:discussion, title: 'Same Title')
      
      expect(discussion1.slug).not_to eq(discussion2.slug)
    end
  end
end 