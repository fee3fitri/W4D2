class Employee
    attr_reader :title, :salary
    attr_accessor :boss

    def initialize(name, title, salary, boss)
        @title = title
        @salary = salary
        @boss = boss
        @name = name
        # @boss.subordinates << self if @boss != nil
    end

    def bonus(multiplier)
        @salary *= multiplier
    end


end