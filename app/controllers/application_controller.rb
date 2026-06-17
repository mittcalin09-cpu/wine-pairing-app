class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  # ↓【追加】一時的な管理者昇格コード（後で消します）
  before_action :temp_make_admin

  def require_admin
    redirect_to root_path, alert: '管理者権限がありません' unless current_user&.admin?
  end

  private

  # ↓【追加】ログイン中のユーザー名が「yama」なら自動で管理者にする魔法のメソッド
  def temp_make_admin
    if current_user && current_user.name == 'yama' && !current_user.admin?
      current_user.admin!
    end
  end
end