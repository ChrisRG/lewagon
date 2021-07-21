require_relative '../views/sessions_view.rb'

class SessionsController
  def initialize(employee_repo)
    @view = SessionsView.new
    @employee_repo = employee_repo
  end

  def sign_in
    # Check username and password
    # Ask the user for username
    username = @view.ask_for_username
    # Ask user for password
    password = @view.ask_for_password
    # Check if there is a user with that username.
    user = @employee_repo.find_by_username(username)
    # if there is such a user, check the password.
    if user && user.password == password
      @view.success(user)
      # Return the correct user if sign-in is succesful
      return user
    else
      # Otherwise, try again and do the sign_in again
      @view.failure
      sign_in
    end
  end
end
