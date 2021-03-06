class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @todays_meals = current_user.meals.today.order('created_at ASC')
      unless current_user.bmr.blank? || current_user.weight.blank? || current_user.protein_intake.blank? || current_user.fat_percentage.blank?
        @total_calories = (@todays_meals.sum(:protein) * 4) + (@todays_meals.sum(:carbohydrates) * 4) + (@todays_meals.sum(:fats) * 9)
        @remaining_calories = (current_user.bmr) - @total_calories
        @remaining_protein = current_user.protein_intake - @todays_meals.sum(:protein)
        @remaining_fats = (current_user.bmr * current_user.fat_percentage / 900).to_i - @todays_meals.sum(:fats)
        @remaining_carbs = carbs_calculator
        @fat_grams = current_user.fat_percentage * current_user.bmr / 900
        @carb_grams = (carbs_calculator + @todays_meals.sum(:carbohydrates))
      end
    end
  end

  def yesterday
    if user_signed_in?
      @yesterdays_meals = current_user.meals.yesterday.order('created_at ASC')
      unless current_user.bmr.blank? || current_user.weight.blank? || current_user.protein_intake.blank? || current_user.fat_percentage.blank?
        @total_calories = (@yesterdays_meals.sum(:protein) * 4) + (@yesterdays_meals.sum(:carbohydrates) * 4) + (@yesterdays_meals.sum(:fats) * 9)
        @remaining_calories = (current_user.bmr) - @total_calories
        @remaining_protein = current_user.protein_intake - @yesterdays_meals.sum(:protein)
        @remaining_fats = (current_user.bmr * current_user.fat_percentage / 900).to_i - @yesterdays_meals.sum(:fats)
        @remaining_carbs = carbs_calculator_yes
        @fat_grams = current_user.fat_percentage * current_user.bmr / 900
        @carb_grams = (carbs_calculator_yes + @yesterdays_meals.sum(:carbohydrates))
      end
    end
  end

  def favourites
    @favourites = current_user.meals.where(favourite: true)
  end

  def new
    @meal = current_user.meals.build
  end

  def edit
  end

  def create
    @meal = current_user.meals.build(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to root_path, notice: 'Meal was successfully added.' }
      else
        format.html { render action: 'new', notice: 'Meal was not added.' }
      end
      format.js
    end
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to root_path, notice: 'Meal was successfully updated.' }
      else
        format.html { render action: 'edit', notice: 'Meal was not updated.' }
      end
      format.js
    end
  end

  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private
    def set_meal
      @meal = Meal.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:name, :description, :calories, :protein, :carbohydrates, :fats, :start_time, :end_time, :favourite)
    end

    def carbs_calculator
      (current_user.bmr - ((@remaining_protein + @todays_meals.sum(:protein)) * 4) - ((@remaining_fats + @todays_meals.sum(:fats)) * 9) - (@todays_meals.sum(:carbohydrates) * 4)) / 4
    end

    def carbs_calculator_yes
      (current_user.bmr - ((@remaining_protein + @yesterdays_meals.sum(:protein)) * 4) - ((@remaining_fats + @yesterdays_meals.sum(:fats)) * 9) - (@yesterdays_meals.sum(:carbohydrates) * 4)) / 4
    end
end
