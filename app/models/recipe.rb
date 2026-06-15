class Recipe < ApplicationRecord
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags

  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
end