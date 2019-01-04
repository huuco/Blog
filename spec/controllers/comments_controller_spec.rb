require "rails_helper"
RSpec.describe CommentsController, type: :controller do
  describe "before action :load_post" do
    context "before login" do
      it "is expected to define before action" do
        expect{assigns(:user).to use_before_action :load_post}
      end
    end
  end
  describe "before action :load_comment" do
    context "before load_comment" do
      it "is expected to define before action" do
        expect{assigns(:user).to use_before_action :load_comment}
      end
    end
  end
  describe "before action :authenticate_user!" do
    context "before login" do
      it "is expected to define before action" do
        expect{assigns(:user).to use_before_action :authenticate_user!}
      end
    end
  end
  describe "POST #create" do
    context "when params correct" do
      let!(:params) {{comment: {content: "good"}, post_id: 1}}
      before do
        post :create, params: params, format: :json
      end
      it "is expected to create new comment" do
        expect{assigns(:comment).to be_instance_of(Comment)}
      end
    end
  end
  describe "GET #edit" do
    context "when params correct" do
      let!(:params) {{post_id: 2,id: 1}}
      before do
        get :edit, params: params, format: :json
      end
      it "is expected to edit comment" do
        expect{assigns(:comment).to eq(User.find_by id: 1)}
      end
    end
  end
   describe "PATCH #update" do
    context "when params correct" do
      let!(:params) {{post_id: 2,id: 1}}
      before do
        patch :update, params: params, format: :json
      end
      it "is expected to edit comment" do
        expect{response.to redirect_to comments_path}
      end
    end
  end
end
