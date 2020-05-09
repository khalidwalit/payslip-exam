require_relative '../lib/generate_payslip'

describe GeneratePayslip do
    describe "GeneratePayslip" do

        payslip = GeneratePayslip.new.generate_payslip("Ren", 60000)

        it 'returns employee_name' do
            expect(payslip.employee_name).to eq "Ren"
        end

        it 'returns annual_salary' do
            expect(payslip.annual_salary).to eq %{60000.00}
        end

        it 'returns gross_monthly_income' do
            expect(payslip.gross_monthly_income).to eq %{5000.00}
        end

        it 'returns monthly_income_tax' do
            expect(payslip.monthly_income_tax).to eq %{500.00}
        end

        it 'returns net_monthly_income' do
            expect(payslip.net_monthly_income).to eq %{4500.00}
        end
    end
end 