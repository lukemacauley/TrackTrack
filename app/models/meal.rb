class Meal < ActiveRecord::Base

	scope :today, lambda { 
		where("created_at > ?", Time.zone.now.beginning_of_day)
		.where("created_at < ?", Time.zone.now.end_of_day)
	}

	scope :yesterday, lambda {
		where("created_at > ?", Time.zone.now.beginning_of_day - 1.day)
		.where("created_at < ?", Time.zone.now.end_of_day - 1.day)
	}

	validates :name, presence: true
	validates :calories, presence: true, numericality: { only_integer: true }
	validates :protein, numericality: { only_integer: true }
	validates :carbohydrates, numericality: { only_integer: true }
	validates :fats, numericality: { only_integer: true }

	belongs_to :user
	
end