require_relative 'app/repositories/meal_repository'

csv_path = File.join(__dir__, 'data/meals.csv')
repo = MealRepository.new(csv_path)
p repo.all
new_meal = Meal.new(name: 'sushi', price: 50)
repo.add(new_meal)
p repo.all