json.array!(@meals) do |meal|
  json.extract! meal, :calories, :protein, :carbohydrates, :fats, :start_time, :end_time
  json.url meal_url(meal, format: :json)
end
