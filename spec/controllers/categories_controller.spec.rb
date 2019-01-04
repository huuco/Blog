require "rails_helper"

RSpec.describe CategoriesController, type: :controller do

  describe "GET #index" do
    it "is expected render tempalte" do
      expect{response.to render_template :index}
    end
    it "is expected result find" do
      expect{assigns(:categories).to match(category.all)}
    end
  end

  describe "GET #show" do
   let!(:params) {{id: 1}}
    before do
      get :show, params: params
    end
    it "is expected to set user instance variable" do
       expect{assigns(:category).to eq(Category.find_by id: params[:id])}
    end
    it "is expected to render tempalte" do
       expect{response.to render_template :show}
     end
  end

  describe "POST #create" do
    let!(:params) {{category: {name: "category"}}}

    before do
      post :create, params: params
    end

    it "create a new category" do
      expect{assigns(:category).to change(Category.count).by(1)}
    end
  end
end
