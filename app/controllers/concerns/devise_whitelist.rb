module DeviseWhitelist
  extend ActiveSupport::Concern

  include do
    before_filter :configure_permitted_parameters, if: :devise_controller?
    #devise controller와 관련있을 때만 이를 실행한다
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
