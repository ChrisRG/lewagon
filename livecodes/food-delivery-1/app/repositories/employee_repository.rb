require 'csv'
require_relative '../models/employee'
require_relative 'base_repository'

class EmployeeRepository < BaseRepository

  def find_by_username(user_name)
    @elements.find { |element| element.username == user_name }
  end

  def all_riders
    @elements.select { |employee| employee.rider? }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_path, options) do |row|
        row[:id] = row[:id].to_i
        @elements << Employee.new(row)
    end
  end
end
