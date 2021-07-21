require_relative '../models/order'
require_relative 'meal_repository'
require_relative 'customer_repository'
require_relative 'employee_repository'

class OrderRepository
    def initialize(csv_path, meal_repository, customer_repository, employee_repository)
        @csv_path = csv_path
        @orders = []
        @meal_repository = meal_repository
        @customer_repository = customer_repository
        @employee_repository = employee_repository
        load_csv if File.exist?(@csv_path)
        @next_id = @orders.last.id + 1 unless @orders.empty?
      end

    def undelivered_orders
        # TODO
    end

    private

    def load_csv
        options = { headers: :first_row, header_converters: :symbol}
        CSV.foreach(@csv_path, options) do |row|
            row[:id] = row[:id].to_i
            row[:delivered] = row[:delivered] == "true"
            row[:meal] = @meal_repository.find(row[:meal_id].to_i)
            row[:customer] = @customer_repository.find(row[:customer_id].to_i)
            row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      @orders << Order.new(row)
            @orders << Order.new(row)
        end
    end

    def save_csv
        CSV.open(@csv_path, "wb") do |csv|
            csv << ['id', 'meal_id', 'customer_id', 'employee_id', 'delivered']
            @orders.each do |order|
                csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered]
            end
        end
    end
end