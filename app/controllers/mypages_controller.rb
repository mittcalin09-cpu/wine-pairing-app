class MypagesController < ApplicationController
  before_action :require_login

  def show
    @bookmark_recipes = current_user.bookmark_recipes
  end
end