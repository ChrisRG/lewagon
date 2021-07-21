require_relative '../views/customers_view'
require_relative '../views/meals_view'
require_relative '../views/orders_view'
require_relative '../views/sessions_view'

class OrdersController
    def initialize(meal_repo, customer_repo, employee_repo, order_repo)
      @meal_repo = meal_repo
      @customer_repo = customer_repo
      @employee_repo = employee_repo
      @order_repo = order_repo
      @meals_view = MealsView.new
      @customers_view = CustomersView.new
      @sessions_view = SessionsView.new
      @orders_view = OrdersView.new
    end

    # As a manager, I can add a new order
    def add
        meal = select_meal
        customer = select_customer
        employee = select_employee
        order = Order.new(meal: meal, customer: customer, employee: employee)
        @order_repo.create(order)
    end

    # As a manager, I can list all the undelivered orders
    def list_undelivered_orders
        orders = @order_repo.undelivered_orders
        @orders_view.display(orders)
    end
    
    # As a rider, I list all my undelivered orders
    def list_my_orders(current_user)
        orders = @order_repo.undelivered_orders.select { |order| order.employee.id == current_user.id }
        @orders_view.display(orders)
    end

    # As a rider, I can mark one of my orders as delivered
    def mark_as_delivered(current_user)
        list_my_orders(current_user)
        order_index = @orders_view.ask_for(:index).to_i
        my_orders = @order_repo.undelivered_orders.select { |order| order.employee.id == current_user.id }
        order = my_orders[order_index - 1]
        @order_repo.mark_as_delivered(order)
    end

    def select_meal
        meals = @meal_repo.all
        @meals_view.display(meals)
        meal_index = @orders_view.ask_for(:index).to_i
        meals[meal_index - 1]
    end

    def select_customer
        customers = @customer_repo.all
        @customers_view.display(customers)
        customer_index = @orders_view.ask_for(:index).to_i
        customers[customer_index - 1]
    end

    def select_employee
        employees = @employee_repo.all_riders
        @sessions_view.display(employees)
        employee_index = @orders_view.ask_for(:index).to_i
        employees[employee_index - 1]
    end
end