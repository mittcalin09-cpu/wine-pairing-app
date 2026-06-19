class StaticPagesController < ApplicationController
  def top
    # まず全レシピをベースにする
    @recipes = Recipe.all

    # ① 食材（キーワード）での検索が実行された場合
    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @recipes = @recipes.left_outer_joins(:tags)
                         .where('recipes.title LIKE ? OR recipes.description LIKE ? OR tags.name LIKE ?', keyword, keyword, keyword)
                         .distinct
    end

    # ② ワインの種類での絞り込み
    if params[:wine_type].present?
      @recipes = @recipes.where(wine_type: params[:wine_type])
    end

    # ③ ワインのボディ（口当たり）での絞り込み
    if params[:wine_body].present?
      @recipes = @recipes.where(wine_body: params[:wine_body])
    end
  end
end