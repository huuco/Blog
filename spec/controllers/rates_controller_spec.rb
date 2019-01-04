require "rails_helper"
RSpec.describe RatesController do
  let!(:user) {FactoryBot.create :user}
  let!(:category) {FactoryBot.create :category, name: "the thao"}
  let!(:post) {FactoryBot.create :post, title: "hello", category: category,
   user: user, content: "content"}
   let!(:rate) {FactoryBot.create :rate, star: 4, content: "good", user: user, post: post}
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
  describe "before action :load_rate" do
    context "before load rate" do
      it "is expected to define before action" do
        expect{assigns(:rate).to use_before_action :load_rate}
      end
    end
  end
  describe "POST #create" do
    it "create a new like" do
      expect{assigns(:rate).to change(Rate.count).by(0)}
    end
  end
  describe "GET #new" do
    it "is expected render template" do
      expect{response.to render_template :new}
    end
     it "return http success" do
      expect{(response).to have_http_status(200)}
    end
  end

  describe "GET #edit" do
    it "return http success" do
      expect{(response).to have_http_status(200)}
    end
    it "is expected to set user instance variable" do
      expect{assigns(:rate).to eq(Rate.find_by id: params[:id])}
    end

    it "is expected to render edit template" do
      expect{response.to render_template :edit}
    end
  end

  describe "PATCH #update" do
    let!(:params) {{rate: {star: 2, content: "content"}, post: post}}
    it "return http success" do
      expect{(response).to have_http_status(200)}
    end
    it "is expected to set flash message" do
      expect{flash[:success].to eq("Update succeed")}
    end
    it "is expected to find rate" do
      expect{assigns(:rate).to match(Rate.find_by id: rate.id)}
    end
  end
end
