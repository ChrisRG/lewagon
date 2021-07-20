class CustomersView
    def display(customers)
        puts ""
        customers.each_with_index do |customer, index|
            puts "#{index + 1}. #{customer.name}: #{customer.address}"
        end
        puts ""
    end

    def ask_user_for(item)
        puts "Insert #{item}"
        print "> "
        gets.chomp
    end
end