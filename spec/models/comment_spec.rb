require "rails_helper"

RSpec.describe Comment, type: :model do
  let!(:category) {FactoryBot.create :category, name: "Rubic"}
  let!(:user) {FactoryBot.create(:user, name: "Nguyen",
    email: Faker::Internet.email, password: "12345678",
     password_confirmation: "12345678")}
  let!(:post) {FactoryBot.create(:post, title: "title", content: "luck",
   user_id: user.id,category_id: category.id
   )}
  let!(:comment) {FactoryBot.create(:comment, content: "good", user_id: user.id, post_id: post.id)}

  describe "validations" do
    it {is_expected.to validate_presence_of :content}
    it {is_expected.to validate_presence_of :user}
    it {is_expected.to validate_presence_of :post}
  end

  context "associations" do
    it {is_expected.to belong_to(:user)}
    it {is_expected.to belong_to(:post)}
  end
end

