require_relative './generate_payslip'

if ARGV.length < 3
    puts "Please specify function and arguments"

    puts "generate_monthly_payslip {employee_name} {annual_salary}"
    exit
end

if ARGV[0] == "generate_monthly_payslip"

    payslip = GeneratePayslip.new.generate_payslip(ARGV[1].to_s, ARGV[2].to_i)

    puts "Monthly Payslip for: " + ARGV[1].to_s
    puts "Gross Monthly Income: " + payslip.gross_monthly_income
    puts "Monthly Income Tax: " + payslip.monthly_income_tax
    puts "Net Monthly Income: " + payslip.net_monthly_income
end 
