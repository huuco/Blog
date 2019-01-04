require "rails_helper"
RSpec.describe PostsController, type: :controller do
  describe "before action :load_post" do
    context "before load_post" do
      it "is expected to define before action" do
        expect{assigns(:post).to use_before_action :load_post}
      end
    end
  end
  describe "before action :authenticate_user!" do
    context "before authenticate_user" do
      it "is expected to define before action" do
        expect{assigns(:user).to use_before_action :authenticate_user!}
      end
    end
  end

  describe "GET #index" do
    let!(:user1) {FactoryBot.create(:user, name: "co123",
      email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")}
    let!(:category) {FactoryBot.create :category, name: "Rubic"}
    let!(:post) {FactoryBot.create :post, title: "sherlock home",
     category: category, user: user1, content: "tham tu"}
    before do
      get :index
    end
    it "is expected render tempalte" do
      expect{response.to render_template :index}
    end
    it "is expected result find" do
      expect{assigns(:posts).to match(Post.all)}
    end
  end
  describe "GET #new" do
    before do
      get :new
    end
    it "is expected render tempalte" do
      expect{response.to render_template :new}
    end
  end

  describe "GET #show" do
    let!(:params) {{id: 1}}
    before do
      get :show, params: params
    end
    it "render tempalte" do
      expect{response.to render_template :show}
    end
  end

  describe "POST #create" do
    let!(:category){FactoryBot.create :category, name: "the thao"}
    let!(:user) {FactoryBot.create :user}
    let!(:params) {{post: {title: "vietname vo dich aff suduki cup",
     category: category, content: "adads"}}}
    before do
      post :create, params: params
    end
    it "create a new post" do
      expect{assigns(:post).to change(Post.count).by(1)}
    end
  end

  describe "GET #edit" do
    let!(:params) {{id: Faker::Number.number}}
    before do
      get :edit, params: params
    end
    it "is expected find user instance variable" do
      expect{assigns(:post).to eq Post.find_by id: 1}
    end
  end
  describe "PATCH #update" do
    let!(:params) {{id: Faker::Number.number}}
    before do
      patch :update, params: params
    end
    context "When post exist database" do
      it "is expected to update post" do
        expect{(post.reload.title).to eq("content update")}
      end
    end
  end
  describe "DELETE @destroy" do
    let!(:params) {FactoryBot.create :post}
    before do
      delete :destroy, params: params
    end
  end
end
