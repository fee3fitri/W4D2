require_relative "employee"

class Manager < Employee
    attr_accessor :subordinates, :boss
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @subordinates = []
        # self.add_subordinates_rec
    end

    def add_subordinates_rec
        @subordinates.each do |employee|
            return self if @subordinates.empty?
            @subordinates << employee.subordinates.add_subordinates_rec  
        end 
    end

    def bonus(multiplier)
        (@subordinates.uniq.map {|subordinate| subordinate.salary}.sum) * multiplier
    end
end

david = Employee.new("david", "TA", 10000, nil)
shawna = Employee.new("shawna", "TA", 12000, nil)
darren = Manager.new("darren", "TA Manager", 78000, nil)
david.boss = darren
shawna.boss = darren
ned = Manager.new("ned", "Founder", 100000, nil)
darren.boss = ned
darren.subordinates = [david, shawna]
ned.subordinates = [darren]

p ned.add_subordinates_rec