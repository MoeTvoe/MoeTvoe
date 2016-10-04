class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end

  # показывает может ли текущий залогиненный юзер править эту модель
  def current_user_can_edit?(model)
    user_signed_in? &&
        (model.user == current_user || # если у модели есть юзер и он залогиненный
            (model.try(:item).present? && model.item.user == current_user))
  end

end
