class AddFavouriteToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :favourite, :boolean
    add_index :meals, :favourite
  end
end
