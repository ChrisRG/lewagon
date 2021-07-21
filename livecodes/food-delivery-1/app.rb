# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

meal_csv = File.join(__dir__, 'data/meals.csv')
meal_repo = MealRepository.new(meal_csv)
meal_control = MealsController.new(meal_repo)

customer_csv = File.join(__dir__, 'data/customers.csv')
customer_repo = CustomerRepository.new(customer_csv)
customer_control = CustomersController.new(customer_repo)

employee_csv = File.join(__dir__, 'data/employees.csv')
employee_repo = EmployeeRepository.new(employee_csv)
sessions_control = SessionsController.new(employee_repo)

router = Router.new(meal_control, customer_control, sessions_control)

router.run
