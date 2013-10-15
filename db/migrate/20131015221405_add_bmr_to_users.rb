class AddBmrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bmr, :integer
  end
end
