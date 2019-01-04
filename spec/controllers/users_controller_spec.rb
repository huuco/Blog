require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "before action :authenticate_user!" do
      context "before login" do
        it "is expected to define before action" do
          expect{assigns(:user).to use_before_action :authenticate_user!}
        end
      end
    end
  describe "GET #index" do
    let!(:user1) {FactoryBot.create(:user, name: "co123",
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}
    let!(:user2) {FactoryBot.create(:user, name: "Nguyen",
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}
    it "render new template" do
      expect{response.to render_template :index}
    end
    it "is expected to assign user instance variable" do
      expect{assigns(:users).to be_instance_of(User.all)}
    end
  end
  describe "GET #show" do
    let!(:user1) {FactoryBot.create(:user, name: "co123",
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}
    it "render new template" do
      expect{response.to render_template :index}
    end

    it "is expected to set user instance variable" do
       expect{assigns(:user).to eq(User.find_by id: params[:id])}
     end
  end
end
