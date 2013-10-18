class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @todays_meals = current_user.meals.today
      @previous_meals = current_user.meals.previous
      @remaining_calories = current_user.bmr - @todays_meals.sum(:calories)
      @remaining_protein = current_user.weight.to_i - @todays_meals.sum(:protein)
      @remaining_fats = (current_user.bmr*0.2/9).to_i - @todays_meals.sum(:fats)
      @remaining_carbs = ((current_user.bmr) - (@remaining_protein*4) - (@remaining_fats*9) - (@todays_meals.sum(:carbohydrates)*4))/4
    end
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
      params.require(:meal).permit(:name, :calories, :protein, :carbohydrates, :fats, :start_time, :end_time)
    end
end
