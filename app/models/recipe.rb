class Recipe < ApplicationRecord
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags
  has_one_attached :image

  enum wine_type: { red: 0, white: 1, rose: 2 }
  enum wine_body: { light: 0, medium: 1, full: 2 }

  validates :title, presence: true
  validates :description, presence: true

  has_many :bookmarks, dependent: :destroy

  # フォームに「牛肉, チーズ」のように表示するためのメソッド
  def tag_names
    tags.map(&:name).join(', ')
  end

  # フォームから送られてきた「牛肉, チーズ」を分割して、タグとして保存するメソッド
  def tag_names=(names)
    if names.present?
      self.tags = names.split(',').map do |n|
        Tag.find_or_create_by(name: n.strip) # stripで前後の空白を削除
      end
    else
      self.tags = [] # 空欄の場合はタグを全解除
    end
  end
end