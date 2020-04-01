class ApplicationController < ActionController::Base


  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    root_path
  end

protected

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end
end
