class RatesController < ApplicationController
  before_action :load_post
  before_action :load_rate, only: %i(edit update destroy)
  before_action :authenticate_user!, only: %i(new edit)

 def new
    @rate = Rate.new
 end

 def create
    @rate = current_user.rates.build rate_params
<<<<<<< HEAD
    @rate.user = current_user
=======
    @rate.user_id = current_user.id
>>>>>>> 7acb049... add comment, edit comment, destroy comment
    @rate.post_id = params[:post_id]
    if @rate.save
      flash[:success] = t "flash.save_success"
      redirect_to @post
    else
<<<<<<< HEAD
      respond_to {|format| format.js }
=======
      render :new
>>>>>>> 7acb049... add comment, edit comment, destroy comment
    end
 end

 def edit; end

 def update
  @rate.update_attributes rate_params
  if @rate.save
    flash[:success] = t "flash.update_success"
    redirect_to @post
  else
    flash[:danger] = t "flash.update_failed"
    render :edit
  end
 end

 def destroy

 end

 private

 def load_post
   @post = Post.find_by id: params[:post_id]
   load_info @post
 end

 def load_rate
    @rate = Rate.find_by id: params[:id]
    load_info @rate
 end

 def rate_params
   params.require(:rate).permit :star, :content
 end
end
