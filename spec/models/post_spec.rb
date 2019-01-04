require "rails_helper"
RSpec.describe Post, type: :model do
  let!(:user) {FactoryBot.create :user}
  let!(:category) {FactoryBot.create :category, name: "Rubic"}
  let!(:post) {FactoryBot.create :post, title: "Stay hungry",
   content: "Stay with me", category: category, user_id: user.id}
    describe "Validations" do
      it {is_expected.to validate_presence_of :title}
      it {is_expected.to validate_presence_of :content}
      it {is_expected.to validate_presence_of :category}
      it {is_expected.to validate_presence_of :user}
      it {is_expected.to validate_length_of(:title).is_at_most Settings.post.maximum_title}
    end
    describe "associations" do
      it  {is_expected.to have_many(:rates).dependent :destroy}
      it  {is_expected.to have_many(:likes).dependent :destroy}
      it  {is_expected.to have_many(:comments).dependent :destroy}
      it  {is_expected.to belong_to(:user)}
      it  {is_expected.to belong_to(:category)}
    end
    describe "scope" do
      let!(:category) {FactoryBot.create :category, name: "Rubic"}
      let!(:user1) {FactoryBot.create(:user, name: "co123",email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}
      let!(:user2) {FactoryBot.create(:user, name: "Nguyen",email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}

      let!(:post1) {FactoryBot.create(:post, title: "Mua dong",category_id: category.id,content: "Nhiet xuong ky luc", user_id: user1.id)}
      let!(:post2) {FactoryBot.create(:post, title: "Mua dong",category_id: category.id,content: "Nhiet xuong ky luc", user_id: user2.id)}
      let!(:rate1) {FactoryBot.create :rate, user_id: user1.id, post_id: post1.id, star: 2, content: "good"}
      let!(:rate2) {FactoryBot.create :rate, user_id: user2.id, post_id: post2.id, star: 5, content: "good"}
      let!(:rate3) {FactoryBot.create :rate, user_id: user2.id, post_id: post2.id, star: 5, content: "good"}
      let!(:rate4) {FactoryBot.create :rate, user_id: user1.id, post_id: post1.id, star: 5, content: "good"}
      let!(:rate5) {FactoryBot.create :rate, user_id: user2.id, post_id: post2.id, star: 5, content: "good"}
      it do
        expect(Post.show_post_host.map(&:id)).to eq([post2.id, post1.id])
      end
    end
end
