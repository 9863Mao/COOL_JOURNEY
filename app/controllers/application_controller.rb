class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_homes_top_path
    else
    public_user_path(current_user.id)
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :telephone_number, :user_nickname])
  end
end
