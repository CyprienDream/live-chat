class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: %i[home]

  include Pundit
  # rescue_from Pundit::NotAuthorizedError, with: :not_authorized


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: %i[username bio photo])
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user) # your path
  end

  def after_sign_up_path_for(_resource)
    user_path(current_user) # your path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def not_authorized
    flash[:alert] = "Log in as admin"
    redirect_back fallback_location: root_path
  end
end
