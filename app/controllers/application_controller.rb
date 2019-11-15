class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  # deviseで名前も保存できるようにする                deviseに関連する画面に移動した時に？という意味
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
# devise_parameter_sanitizer.permit ストロングパラメーターの指定の仕方