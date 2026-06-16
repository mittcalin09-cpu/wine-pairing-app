class BookmarksController < ApplicationController
  before_action :require_login

  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.bookmark(@recipe)
    
    if request.referer&.include?('mypage')
      redirect_to mypage_path, status: :see_other
    else
      redirect_to recipe_path(@recipe), status: :see_other
    end
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    recipe = bookmark.recipe
    current_user.unbookmark(recipe)
    
    if request.referer&.include?('mypage')
      redirect_to mypage_path, status: :see_other
    else
      redirect_to recipe_path(recipe), status: :see_other
    end
  end
end