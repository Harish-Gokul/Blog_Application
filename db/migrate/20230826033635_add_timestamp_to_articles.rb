class AddTimestampToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles,"created_on",:datetime
    add_column :articles,:updated_on,:datetime
  end
end
