class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  def require_admin
    redirect_to root_path, alert: '管理者権限がありません' unless current_user&.admin?
  end
end