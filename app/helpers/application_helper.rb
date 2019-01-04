module ApplicationHelper
   def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_comment
    @resource_comment ||= Comment.new
  end

  def index_for_list object, counter
    ((object.current_page - 1)  * object.limit_value) + counter + 1
  end

  def liked? post_id
    current_user.likes.find_by(post_id: post_id).present?
  end

  def rating post_id
    rates = post_id.rates
    if post_id.rates.blank?
      1
    else
      post_id.rates.average(:star).round(2).to_f
    end
  end
end
