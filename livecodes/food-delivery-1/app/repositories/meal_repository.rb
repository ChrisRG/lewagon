require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
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
            @elements << Meal.new(row)
        end
    end

    def save_csv
        CSV.open(@csv_path, "wb") do |csv|
            csv << ['id', 'name', 'price']
            @elements.each do |meal|
                csv << [meal.id, meal.name, meal.price]
            end
        end
    end
end