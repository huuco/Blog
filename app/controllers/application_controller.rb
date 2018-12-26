class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up,
     keys: %i(name email password password_confirmation)
     devise_parameter_sanitizer.permit :account_update,
      keys: %i(name birthday phone avatar avatar_cache)
  end

<<<<<<< HEAD
  def load_info resource
    return if resource
    render file: "public/404.html", status: :not_found, layout: false
  end
=======
>>>>>>> c312721... signup-login-edit-user
end
