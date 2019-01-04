require "rails_helper"

RSpec.describe Category, type: :model do
  let!(:user1) {FactoryBot.create(:category, name: "co123")}

  describe "validations" do
    it {is_expected.to validate_presence_of :name}
  end

  context "associations" do
    it {is_expected.to have_many(:posts).through(:post_categories)}
  end
end
