class Meal < ActiveRecord::Base

	validates :name, presence: true
	validates :calories, numericality: { only_integer: true }
	validates :protein, numericality: { only_integer: true }
	validates :carbohydrates, numericality: { only_integer: true }
	validates :fats, numericality: { only_integer: true }

	belongs_to :user

end
