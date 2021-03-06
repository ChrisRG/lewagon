class Order
    attr_accessor :meal, :customer, :employee, :delivered, :id
    def initialize(attributes = {})
        @id = attributes[:id]
        @meal = attributes[:meal]
        @customer = attributes[:customer]
        @employee = attributes[:employee]
        @delivered = attributes[:delivered] || false
    end

    def delivered?
        @delivered
    end

    def deliver!
        @delivered = true
    end
end