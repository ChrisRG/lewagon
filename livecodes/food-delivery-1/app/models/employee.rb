class Employee
  attr_accessor :id
  attr_reader :user_name, :password

  def initialize(attrs={})
    @id = attrs[:id]
    @user_name = attrs[:user_name]
    @password = attrs[:password]
    @role = attrs[:role]
  end

  def manager?
    @role == 'manager'
  end
end
