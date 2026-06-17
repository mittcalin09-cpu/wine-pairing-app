class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  # ↓【追加】本番環境に初期データを投入する魔法のコード（後で消します）
  before_action :temp_seed_data

  def require_admin
    redirect_to root_path, alert: '管理者権限がありません' unless current_user&.admin?
  end

  private

  # ↓【追加】レシピが0件の時だけ、seeds.rbの中身を自動で実行するメソッド
  def temp_seed_data
    if Recipe.count == 0
      Rails.application.load_seed
    end
  end
end