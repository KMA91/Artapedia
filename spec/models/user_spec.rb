require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do
    it 'should save' do
      expect(build(:user)).to be_valid
  end
    it "should not save if name field is blank" do
      expect(build(:user, name: "")).to be_invalid
    end
    it "should not save if username field is blank" do
      expect(build(:user, username: "")).to be_invalid
    end
    it "should not save if email field is blank" do
      expect(build(:user, email: "")).to be_invalid
    end
    it "should not save if email is in incorrect format" do
      expect(build(:user, password: "kevin")).to be_invalid
    end
    it "should not save if password field is blank" do
      expect(build(:user, password: "")).to be_invalid
    end
    it "should not save if confirm password field is blank" do
      expect(build(:user, password_confirmation: "")).to be_invalid
    end
  end
end
