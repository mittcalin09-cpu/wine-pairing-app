class Recipe < ApplicationRecord
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_one_attached :image

  enum wine_type: { red: 0, white: 1, rose: 2 }
  enum wine_body: { light: 0, medium: 1, full: 2 }

  validates :title, presence: true
  validates :description, presence: true

  has_many :bookmarks, dependent: :destroy
end