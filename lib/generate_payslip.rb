
class GeneratePayslip
    attr_accessor :employee_name, :annual_salary, :gross_monthly_income, :monthly_income_tax, :net_monthly_income

    def generate_payslip(employee_name, annual_salary)
        @employee_name = employee_name
        @annual_salary = '%.2f' % annual_salary

        @gross_monthly_income = '%.2f' % calculate_gross_monthly_income
        @monthly_income_tax = '%.2f' % calculate_monthly_income_tax
        @net_monthly_income = '%.2f' % calculate_net_monthly_income
        return self
    end

    private 
    def calculate_gross_monthly_income
        return @annual_salary.to_i / 12
    end

    def calculate_monthly_income_tax
        salary_groups = [0, 20000, 40000, 80000, 180000, 1/0.0]
        tax_rates = [0,0.10,0.20,0.30,0.40];

        salary_left = annual_salary.to_i
        taxible_amount = 0

        salary_groups.length.times do
            |index|
            if salary_left > 0
                tax_range = salary_groups[index + 1] - salary_groups[index]
                taxible_amount += (salary_left > tax_range) ? tax_range * tax_rates[index] : salary_left * tax_rates[index]
                salary_left -= tax_range
            end 
        end
        return taxible_amount / 12
    end

    def calculate_net_monthly_income
        return calculate_gross_monthly_income - calculate_monthly_income_tax
    end
end