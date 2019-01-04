require "rails_helper"

RSpec.describe Category, type: :model do
  let!(:category) {FactoryBot.create(:category, name: "co123")}
  let!(:category1) {FactoryBot.create(:category, name: "co")}

  describe "validations" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_uniqueness_of(:name).case_insensitive}
  end

  describe "associations" do
    it {is_expected.to have_many(:posts)}
  end

  describe "order by created at" do
    # it {expect(Category.by_created_at).to eq([category, category1])}
  end
end
