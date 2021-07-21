class SessionsView
  def ask_for_password
    puts "Please type your personal password"
    gets.chomp
  end

  def ask_for_username
    puts "Please type your username"
    gets.chomp
  end

  def success(user)
    puts "Welcome to the Food Delivery App."
    puts "Signed in as: #{user.username}"
  end

  def failure
    puts "Please try again. Incorrect username and/or password"
  end
end
