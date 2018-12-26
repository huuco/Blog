class RatesController < ApplicationController
  before_action :load_post
  before_action :load_rate, only: %i(edit update destroy)
  before_action :authenticate_user!, only: %i(new edit)

 def new
    @rate = Rate.new
 end

 def create
    @rate = current_user.rates.build rate_params
    @rate.user = current_user
    @rate.post_id = params[:post_id]
    if @rate.save
      flash[:success] = t "flash.save_success"
      redirect_to @post
    else
      respond_to {|format| format.js }
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
