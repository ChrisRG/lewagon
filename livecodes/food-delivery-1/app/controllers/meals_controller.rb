require_relative '../views/meals_view'

class MealsController
    def initialize(meal_repo)
        @meal_repo = meal_repo
        @meals_view = MealsView.new
    end

    def add
        name = @meals_view.ask_user_for(:name)
        price = @meals_view.ask_user_for(:price).to_i
        meal = Meal.new(name: name, price: price)
        @meal_repo.create(meal)
    end

    def list
        meals = @meal_repo.all
        @meals_view.display(meals)
    end

    def delete
        id = @meals_view.ask_user_for(:id).to_i
        @meal_repo.delete(id)
    end

    def edit
        id = @meals_view.ask_user_for(:id).to_i
        name = @meals_view.ask_user_for(:name)
        price = @meals_view.ask_user_for(:price).to_i
        @meal_repo.edit(id, name: name, price: price)
    end
end