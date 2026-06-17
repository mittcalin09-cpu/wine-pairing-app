class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def require_admin
    redirect_to root_path, alert: '管理者権限がありません' unless current_user&.admin?
  end
end
