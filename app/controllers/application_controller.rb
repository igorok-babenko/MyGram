class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    user_posts_path(user)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end
end
