class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    # 種類（wine_type）が選択されていれば絞り込み
    if params[:wine_type].present?
      @recipes = @recipes.where(wine_type: params[:wine_type])
    end

    # 重さ（wine_body）が選択されていれば絞り込み
    if params[:wine_body].present?
      @recipes = @recipes.where(wine_body: params[:wine_body])
    end

    # ↓ここから追加：食材タグ（tag_id）が選択されていれば、中間テーブルを結びつけて絞り込む
    if params[:tag_id].present?
      @recipes = @recipes.joins(:recipe_tags).where(recipe_tags: { tag_id: params[:tag_id] })
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end