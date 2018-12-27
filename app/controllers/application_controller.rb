class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def is_admin?
    user_signed_in? ? current_user.admin? : false
  end

  def after_sign_in_path_for resource
    if resource.admin?
      admin_root_path
    else
      root_path
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up,
     keys: %i(name email password password_confirmation)
     devise_parameter_sanitizer.permit :account_update,
      keys: %i(name birthday phone avatar avatar_cache)
  end


  def load_info resource
    return if resource
    render file: "public/404.html", status: :not_found, layout: false
  end
  def set_search
    @search = Post.ransack(params[:q])
  end

end
