class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_blocked

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :avatar])
  end

  private

  def check_blocked
    if user_signed_in? && current_user.blocked? && current_user.blacklist.ban_duration > Time.now
      blocked_user = current_user
      sign_out current_user

      message = t('application.blocked')
      message += t('application.block_reason', reason: blocked_user.blacklist.reason) if blocked_user.blacklist.present?
      message += t('application.block_end', date: blocked_user.blacklist.ban_duration) if blocked_user.blacklist.present? && !blocked_user.blacklist.is_permanent?

      redirect_to root_path, alert: message
    end
  end

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

end
