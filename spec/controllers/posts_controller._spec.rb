require "rails_helper"
RSpec.describe PostsController, type: :controller do
  describe "before action :load_post" do
    context "before load_post" do
      it "is expected to define before action" do
        expect{assigns(:user).to use_before_action :load_post}
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
    before do
      get :index
    end
    it "is expected render tempalte" do
      expect{response.to render_template :index}
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

  describe "POST #create" do
    category_ids = (1..3).to_a.map do |n|
      Category.create(name: "name")
    end
    let!(:user) {FactoryBot.create :user}
    let!(:params) {{post: {title: "vietname vo dich aff suduki cup",
     category_id: category_ids, content: "adads"}}}
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
