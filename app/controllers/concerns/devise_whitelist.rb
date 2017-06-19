module DeviseWhitelist
  extend ActiveSupport::Concern
  
  included do
     #runb efore all the other controllers
    before_filter :configure_permitted_parameters, if: :devise_controller?
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  end
  
  
end