require 'csv'
require_relative '../models/customer'

class CustomerRepository
    def initialize(csv_path)
        @csv_path = csv_path
        @customers = []
        load_csv
        @next_id = @customers.empty? ? 1 : @customers.last.id + 1
    end

    def all
        @customers
    end

    def add(customer)
        customer.id = @next_id
        @next_id += 1
        @customers << customer
        save_csv
    end

    def find(id)
        @customers.find { |customer| customer.id == id }
    end

    def delete(id)
        customer = find(id)
        @customers.delete(customer)
    end

    def edit(id, attributes = {})
        customer = find(id)
        customer.name = attributes[:name]
        customer.address = attributes[:address]
    end

    private

    def load_csv
        options = { headers: :first_row, header_converters: :symbol}
        CSV.foreach(@csv_path, options) do |row|
            row[:id] = row[:id].to_i
            @customers << Customer.new(row)
        end
    end

    def save_csv
        CSV.open(@csv_path, "wb") do |csv|
            csv << ['id', 'name', 'address']
            @customers.each do |customer|
                csv << [customer.id, customer.name, customer.address]
            end
        end
    end
end