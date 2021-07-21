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
    def add(order)
        # TODO
    end

    # As a manager, I can list all the undelivered orders
    def list_undelivered_orders
        # TODO
    end

    # As a rider, I can mark one of my orders as delivered
    def list_my_orders(current_user)
        # TODO
    end

    # As a rider, I list all my undelivered orders
    def mark_as_delivered(current_user)
        # TODO
    end
end