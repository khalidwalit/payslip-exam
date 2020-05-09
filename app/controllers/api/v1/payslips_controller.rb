require_relative '../../../../lib/generate_payslip.rb'

class Api::V1::PayslipsController < ApplicationController
    def index
        payslip = GeneratePayslip.new.generate_payslip(params[:employee_name], params[:annual_salary].to_i)
        data = {
            employee_name: params[:employee_name],
            gross_monthly_income: payslip.gross_monthly_income,
            monthly_income_tax: payslip.monthly_income_tax,
            net_monthly_income: payslip.net_monthly_income
        }
        
        render json: data, status: 200
    end
end
