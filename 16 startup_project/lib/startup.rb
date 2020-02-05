require "employee"

class Startup
    attr :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries[title] ? true : false
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title) 
        else
            raise "we don't need another #{title}"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        employee_salary = @salaries[employee.title]

        if @funding >= employee_salary
            employee.pay(employee_salary)
            @funding -= employee_salary
        else
            raise "sorry but we don't have enough money"
        end
    end
    
    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        @employees.map {|employee| @salaries[employee.title]}.sum / @salaries.length
    end


    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        @employees.concat(startup.employees)

        startup.salaries.each do |k, v|
            if !@salaries[k]
                @salaries[k] = v
            end
        end

        startup.close
    end

end
