class Droptable < ActiveRecord::Migration[6.1]
  def change
    drop_table :ariticles
  end
end
