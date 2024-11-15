class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    publications_url # o cualquier página que desees como la principal después del login
  end

  protected

  def configure_permitted_parameters
    case params[:action]
    when 'create'
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end
  end
end
