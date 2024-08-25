require 'rails_helper'

RSpec.describe DiscussionPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }
  let(:other_user) { create(:user) }
  let(:discussion) { create(:discussion, user: user) }

  permissions :index?, :show? do
    it "allows access to all users" do
      expect(subject).to permit(nil, Discussion)
      expect(subject).to permit(user, Discussion)
    end
  end

  permissions :create? do
    it "allows creation for signed in users" do
      expect(subject).to permit(user, Discussion)
    end

    it "denies creation for visitors" do
      expect(subject).not_to permit(nil, Discussion)
    end
  end

  permissions :update?, :destroy? do
    it "allows access for admins" do
      expect(subject).to permit(admin, discussion)
    end

    it "allows access for discussion owner" do
      expect(subject).to permit(user, discussion)
    end

    it "denies access for other users" do
      expect(subject).not_to permit(other_user, discussion)
    end

    it "denies access for visitors" do
      expect(subject).not_to permit(nil, discussion)
    end
  end
end 