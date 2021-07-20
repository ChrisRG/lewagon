class MealsView
    def display(meals)
        puts ""
        meals.each_with_index do |meal, index|
            puts "#{index + 1}. #{meal.name}: $#{meal.price}"
        end
        puts ""
    end

    def ask_user_for(item)
        puts "Insert #{item}"
        print "> "
        gets.chomp
    end
end