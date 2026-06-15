class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :wine_type
      t.integer :wine_body

      t.timestamps
    end
  end
end
