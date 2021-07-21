# TODO: implement the router of your app.
class Router
    def initialize(meals_controller, customers_controller, sessions_controller)
        @meals_controller = meals_controller
        @customers_controller = customers_controller
        @sessions_controller = sessions_controller
        @running = true
    end

    def run
      while @running
        @user = @sessions_controller.sign_in
        if @user.manager?
          while @user
            puts "Logged in as Manager"
            choice = display_manager_options
            manager_action(choice)
          end
        else
          while @user
            puts "Logged in as Delivery"
            choice = display_delivery_options
            delivery_action(choice)
          end
        end
      end
    end

    def display_options
        puts "----- MENU -----"
        puts "Make a selection:"
        puts "1 List all meals"
        puts "2 Add a meal"
        puts "3 Edit a meal"
        puts "4 Delete a meal"
        puts "5 List all customers"
        puts "6 Add a customer"
        puts "7 Edit a customer"
        puts "8 Delete a customer"
        puts "9 Exit"
        print "> "
        gets.chomp.to_i
    end

    def display_manager_options
      puts "TODO - DEFINE MANAGER OPTIONS"
      puts "9 Sign Out"
      puts "10 Exit"
      print "> "
        gets.chomp.to_i
    end

    def display_delivery_options
      puts "TODO - DEFINE DELIVERY GUY OPTIONS"
      puts "9 Sign Out"
      puts "10 Exit"
      print "> "
        gets.chomp.to_i
    end

    def manager_action(choice)
        case choice
        # When 1 then ...
        when 1 then @meals_controller.list
        when 2 then @meals_controller.add
        when 3 then @meals_controller.edit
        when 4 then @meals_controller.delete
        when 5 then @customers_controller.list
        when 6 then @customers_controller.add
        when 7 then @customers_controller.edit
        when 8 then @customers_controller.delete
        when 9 then @user = nil
        when 10
          @user = nil
          @running = false
        else
            puts "Unrecognized command"
        end
    end

      def delivery_action(choice)
        case choice
        # When 1 then ...
        when 1 then @meals_controller.list
        when 2 then @meals_controller.add
        when 3 then @meals_controller.edit
        when 4 then @meals_controller.delete
        when 5 then @customers_controller.list
        when 6 then @customers_controller.add
        when 7 then @customers_controller.edit
        when 8 then @customers_controller.delete
        when 9 then @user = nil
        when 10
          @user = nil
          @running = false
        else
            puts "Unrecognized command"
        end
    end
end
