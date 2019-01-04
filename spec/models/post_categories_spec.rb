require "rails_helper"

RSpec.describe PostCategory, type: :model do
  describe "Validation" do
    it {is_expected.to validate_presence_of :post}
    it {is_expected.to validate_presence_of :category}
  end

  describe "association" do
    it {is_expected.to belong_to :post}
    it {is_expected.to belong_to :category}
  end
end
