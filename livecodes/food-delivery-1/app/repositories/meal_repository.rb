require 'csv'
require_relative '../models/meal'

class MealRepository
    def initialize(csv_path)
        @csv_path = csv_path
        @meals = []
        load_csv
        @next_id = @meals.empty? ? 1 : @meals.last.id + 1
    end

    def all
        @meals
    end

    def add(meal)
        meal.id = @next_id
        @next_id += 1
        @meals << meal
        save_csv
    end

    def find(id)
        @meals.find { |meal| meal.id == id }
    end

    def delete(id)
        meal = find(id)
        @meals.delete(meal)
    end

    def edit(id, attributes = {})
        meal = find(id)
        meal.name = attributes[:name]
        meal.price = attributes[:price]
    end

    private

    def load_csv
        options = { headers: :first_row, header_converters: :symbol}
        CSV.foreach(@csv_path, options) do |row|
            row[:id] = row[:id].to_i
            row[:price] = row[:price].to_i
            @meals << Meal.new(row)
        end
    end

    def save_csv
        CSV.open(@csv_path, "wb") do |csv|
            csv << ['id', 'name', 'price']
            @meals.each do |meal|
                csv << [meal.id, meal.name, meal.price]
            end
        end
    end
end