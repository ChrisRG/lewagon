require_relative '../views/customers_view'

class CustomersController
    def initialize(customer_repo)
        @customer_repo = customer_repo
        @customers_view = CustomersView.new
    end

    def add
        name = @customers_view.ask_user_for(:name)
        address = @customers_view.ask_user_for(:address)
        customer = Customer.new(name: name, address: address)
        @customer_repo.create(customer)
    end

    def list
        customers = @customer_repo.all
        @customers_view.display(customers)
    end

    def delete
        id = @customers_view.ask_user_for(:id).to_i
        @customer_repo.delete(id)
    end

    def edit
        id = @customers_view.ask_user_for(:id).to_i
        name = @customers_view.ask_user_for(:name)
        address = @customers_view.ask_user_for(:address)
        @customer_repo.edit(id, name: name, address: address)
    end
end