require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(200) }

  context "validates image format" do
    it "Allows to set png as an image" do
      user               = create(:user)
      subject.attributes = attributes_for(:post)
      subject.user       = user
      is_expected.to be_valid
    end

    it "Not allows to set txt as an image" do
      user               = create(:user)
      subject.attributes = attributes_for(:post, :with_invalid_image)
      subject.user       = user
      is_expected.to be_invalid
    end
  end
end
