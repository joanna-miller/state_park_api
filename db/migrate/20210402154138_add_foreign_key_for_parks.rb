class AddForeignKeyForParks < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :parks, :states
  end
end
