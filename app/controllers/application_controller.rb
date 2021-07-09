class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    atributes = [:name, :bio]
    devise_parameter_sanitizer.permit(:sign_up, keys: atributes)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end

  def after_sign_in_path_for(user)
    user_posts_path(user)
  end

  def after_sign_out_path_for(user)
    root_path
  end
end
