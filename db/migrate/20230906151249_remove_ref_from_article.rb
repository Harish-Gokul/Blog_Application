class RemoveRefFromArticle < ActiveRecord::Migration[6.1]
  def change
    remove_reference :articles,:user,foreign_key: true

  end
end
