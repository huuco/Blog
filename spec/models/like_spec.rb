require 'rails_helper'

RSpec.describe Like, type: :model do
   let!(:category) {FactoryBot.create :category, name: "Rubic"}
  let!(:user) {FactoryBot.create(:user, name: "Nguyen",
    email: Faker::Internet.email, password: "12345678",
     password_confirmation: "12345678")}
  let!(:post) {FactoryBot.create(:post, title: "title", content: "luck",
   user_id: user.id,category_id: category.id
   )}

  describe "validations" do
    it {is_expected.to validate_presence_of :user}
    it {is_expected.to validate_presence_of :post}
  end
  describe "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :post}
  end

  describe "liked?" do
    it {expect((user.likes.find_by post_id: post.id).present?).to eq false}
  end
end
