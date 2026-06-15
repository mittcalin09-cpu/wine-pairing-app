# 既存のデータを一度きれいに削除（初期化）
RecipeTag.delete_all
Recipe.delete_all
Tag.delete_all

# タグの作成
tag_beef = Tag.create!(name: '牛肉')
tag_cheese = Tag.create!(name: 'チーズ')
tag_fish = Tag.create!(name: '白身魚')
tag_tomato = Tag.create!(name: 'トマト')

# レシピの作成
recipe1 = Recipe.create!(
  title: '極上ローストビーフ',
  description: 'じっくり火を通した、ジューシーな赤身肉のローストビーフです。',
  wine_type: 0, # 後で enum 定義（例: 赤ワイン）
  wine_body: 2  # 後で enum 定義（例: フルボディ）
)

recipe2 = Recipe.create!(
  title: '白身魚のカルパッチョ',
  description: 'レモンとオリーブオイルでさっぱり仕上げた、新鮮な魚のカルパッチョ。',
  wine_type: 1, # 後で enum 定義（例: 白ワイン）
  wine_body: 0  # 後で enum 定義（例: ライトボディ）
)

recipe3 = Recipe.create!(
  title: '完熟トマトとモッツァレラのカプレーゼ',
  description: 'フレッシュバジルと濃厚なチーズ、トマトの酸味が抜群の相性です。',
  wine_type: 2, # 後で enum 定義（例: ロゼワイン）
  wine_body: 1  # 後で enum 定義（例: ミディアムボディ）
)

# レシピとタグの中間データの作成（紐付け）
RecipeTag.create!(recipe: recipe1, tag: tag_beef)
RecipeTag.create!(recipe: recipe1, tag: tag_cheese)
RecipeTag.create!(recipe: recipe2, tag: tag_fish)
RecipeTag.create!(recipe: recipe3, tag: tag_tomato)
RecipeTag.create!(recipe: recipe3, tag: tag_cheese)

puts "サンプルデータの作成が完了しました！（レシピ: #{Recipe.count}件、タグ: #{Tag.count}件）"