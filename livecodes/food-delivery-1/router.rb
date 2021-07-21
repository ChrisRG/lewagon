# TODO: implement the router of your app.
class Router
    def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
        @meals_controller = meals_controller
        @customers_controller = customers_controller
        @sessions_controller = sessions_controller
        @orders_controller = orders_controller
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

    def display_manager_options
      puts "1. Add new meal"
      puts "2. List all meals"
      puts "3. Add new customer"
      puts "4. List all customers"
      puts "5. Add new order"
      puts "6. List all undelivered orders"
      puts "7. Logout"
      puts "8. Exit"
      print "> "
      gets.chomp.to_i
    end

    def display_delivery_options
      puts "1. List my undelivered orders"
      puts "2. Mark order as delivered"
      puts "3. Logout"
      puts "4. Exit"
      print "> "
      gets.chomp.to_i
    end

    def manager_action(choice)
      case choice
      when 1 then @meals_controller.add
      when 2 then @meals_controller.list
      when 3 then @customers_controller.add
      when 4 then @customers_controller.list
      when 5 then @orders_controller.add
      when 6 then @orders_controller.list_undelivered_orders
      when 7 then @user = nil
      when 8
        @user = nil
        @running = false
      else
          puts "Unrecognized command"
      end
    end

      def delivery_action(choice)
        case choice
        when 1 then @orders_controller.list_my_orders(@user)
        when 2 then @orders_controller.mark_as_delivered(@user)
        when 3 then @user = nil
        when 4
          @user = nil
          @running = false
        else
            puts "Unrecognized command"
        end
    end
end
