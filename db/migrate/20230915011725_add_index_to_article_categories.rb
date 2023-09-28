class AddIndexToArticleCategories < ActiveRecord::Migration[6.1]
  def change
    add_index :article_categories,[:article_id,:category_id],unique: true
  end
end
