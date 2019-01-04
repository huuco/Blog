require "rails_helper"

RSpec.describe LikesController, type: :controller do
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
  describe "POST #create" do
   it "create a new like" do
      expect{assigns(:like).to change(Like.count).by(1)}
    end
  end

  describe "DELETE #destroy" do
    it "is expected unlike" do
      expect{assigns(:like).to change(Like.count).by(0)}
    end
  end
end
