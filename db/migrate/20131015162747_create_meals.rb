class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :calories, default: 0, null: false
      t.integer :protein, default: 0, null: false
      t.integer :carbohydrates, default: 0, null: false
      t.integer :fats, default: 0, null: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
