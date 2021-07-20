require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'

class CustomerRepository < BaseRepository
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
            @elements << Customer.new(row)
        end
    end

    def save_csv
        CSV.open(@csv_path, "wb") do |csv|
            csv << ['id', 'name', 'address']
            @elements.each do |customer|
                csv << [customer.id, customer.name, customer.address]
            end
        end
    end
end