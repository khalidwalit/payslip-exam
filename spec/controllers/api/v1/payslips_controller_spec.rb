require 'rails_helper'

RSpec.describe Api::V1::PayslipsController, type: :controller do
    describe "GET #index" do
        before {get 'index', :params => { :employee_name => "Ren", :annual_salary => 60000 }}

        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end

        it 'returns data' do
            expect(JSON.parse(response.body).size).to eq(4)
          end

        it 'returns employee_name' do
            data = JSON.parse(response.body)
            expect(data["employee_name"]).to eq "Ren"
        end

        it 'returns gross_monthly_income' do
            data = JSON.parse(response.body)
            expect(data["gross_monthly_income"]).to eq "5000.00"
        end

        it 'returns monthly_income_tax' do
            data = JSON.parse(response.body)
            expect(data["monthly_income_tax"]).to eq "500.00"
        end

        it 'returns net_monthly_income' do
            data = JSON.parse(response.body)
            expect(data["net_monthly_income"]).to eq "4500.00"
        end
    end
end
