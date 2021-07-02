class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Настройка для работы девайза при правке профиля юзера и при регистрации
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Хелпер метод, доступный во вьюхах
  helper_method :current_user_can_edit_event?
  helper_method :current_user_already_subscriber?

  # Настройка для девайза — разрешаем обновлять профиль, но обрезаем
  # параметры, связанные со сменой пароля.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :current_password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  # Вспомогательный метод, возвращает true, если текущий залогиненный юзер может править указанное событие
  def current_user_can_edit_event?(model)
    user_signed_in? && (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  def current_user_already_subscriber?(model)
    user_signed_in? && model.subscriptions.map {|item| item.user&.id}.include?(current_user.id)
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t('pundit.not_authorized')
    redirect_to(request.referrer || root_path)
  end

end
