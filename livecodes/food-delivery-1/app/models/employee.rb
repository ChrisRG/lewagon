class Employee
  attr_accessor :id
  attr_reader :username, :password

  def initialize(attrs={})
    @id = attrs[:id]
    @username = attrs[:username]
    @password = attrs[:password]
    @role = attrs[:role]
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end
