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

      message = "Ви заблоковані."
      message += " Причина: #{blocked_user.blacklist.reason}." if blocked_user.blacklist.present?
      message += " Дата закінчення блокування: #{blocked_user.blacklist.ban_duration}." if blocked_user.blacklist.present? && !blocked_user.blacklist.is_permanent?

      redirect_to root_path, alert: message
    end
  end
end
