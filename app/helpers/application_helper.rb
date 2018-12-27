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
end
