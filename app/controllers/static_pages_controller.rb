class StaticPagesController < ApplicationController
  def top
    # まず全レシピをベースにする
    @recipes = Recipe.all

    # ① 食材（キーワード）での検索
    if params[:keyword].present?
      @recipes = @recipes.where('title LIKE ? OR description LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end

    # ② ワインの種類での絞り込み
    if params[:wine_type].present?
      @recipes = @recipes.where(wine_type: params[:wine_type])
    end

    # ③ 【追加】ワインのボディ（口当たり）での絞り込み
    if params[:wine_body].present?
      @recipes = @recipes.where(wine_body: params[:wine_body])
    end
  end
end