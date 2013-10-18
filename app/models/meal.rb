class Meal < ActiveRecord::Base

	scope :today, lambda { 
		where("created_at > ?", Time.now.beginning_of_day)
		.where("created_at < ?", Time.now.end_of_day) 
	}
	scope :previous, lambda {
		where("created_at < ?", Time.now.beginning_of_day) 
	}

	validates :name, presence: true
	validates :calories, numericality: { only_integer: true }
	validates :protein, numericality: { only_integer: true }
	validates :carbohydrates, numericality: { only_integer: true }
	validates :fats, numericality: { only_integer: true }

	belongs_to :user

end
