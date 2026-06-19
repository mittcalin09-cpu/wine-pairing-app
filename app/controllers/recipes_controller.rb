class RecipesController < ApplicationController

  before_action :require_admin, only: %i[edit update]

  def index
    @recipes = Recipe.all

    if params[:wine_type].present?
      @recipes = @recipes.where(wine_type: params[:wine_type])
    end

    if params[:wine_body].present?
      @recipes = @recipes.where(wine_body: params[:wine_body])
    end

    if params[:tag_id].present?
      @recipes = @recipes.joins(:recipe_tags).where(recipe_tags: { tag_id: params[:tag_id] })
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'レシピを更新し、画像を保存しました！'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :wine_type, :wine_body, :tag_names)
  end
end