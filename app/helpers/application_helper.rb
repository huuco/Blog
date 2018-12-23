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

<<<<<<< HEAD
=======
  def resource_comment
    @resource_comment ||= Comment.new
  end
>>>>>>> 7acb049... add comment, edit comment, destroy comment
end
