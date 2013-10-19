class AddProteinIntakeAndFatPercentageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :protein_intake, :integer
    add_column :users, :fat_percentage, :integer
  end
end
