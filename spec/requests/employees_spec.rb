require 'rails_helper'

RSpec.describe "Employees", type: :request do
  let(:employee) { create(:employee) }
  let(:employee_attributes) { attributes_for(:employee) }

  describe "GET /getting_data_for_api" do
    let(:resp_random_user_api) { RestClient.get("https://randomuser.me/api?format=json&results=1&inc=gender,name,email,picture&nat=br&seed=giga") }

    it 'Create a least one employee with data from the external API' do
      
      resp_json = JSON.parse resp_random_user_api.body

      employee_params = { 
        title: resp_json['results'][0]['name']['title'], 
        firtsname: resp_json['results'][0]['name']['first'], 
        lastname: resp_json['results'][0]['name']['last'],
        gender: resp_json['results'][0]['gender'],
        email: resp_json['results'][0]['email']
      }
      
      post employees_path, params: { employee: employee_params }

      expect(response).to have_http_status(201)
    end

    it "Adding a photo from data of external API" do
      resp_json = JSON.parse resp_random_user_api.body

      employee_attributes['avatar'] = resp_json['results'][0]['picture']['large']
      post employees_path, params: { employee: employee_attributes }

      expect(response).to have_http_status(201)
    end
  end

  describe "GET /employees" do
    it "return status 200" do
      get employees_path
      expect(response).to have_http_status(200)
    end

    it "returns a employee content" do
      get employees_path(employee)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /employees" do
    context "when it has valid parameters" do
      it 'creates a new employee' do
        post(employees_path, params: { employee: employee_attributes })
        expect(Employee.last).to have_attributes(employee_attributes)
        expect(response).to have_http_status(201)
      end
    end

    context "when it has invalid parameters" do
      it 'does not create a new employee' do
        employee_attributes = { title:"", firstname:"", lastname:"", email:"", gender:""}
        post employees_path, params: { employee: employee_attributes}
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT /employees" do
    context "when the employee exists" do
      before(:each) { patch employee_path(employee), params: { employee: employee_attributes } }

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the record' do
        expect(employee.reload).to have_attributes(employee_attributes)
      end
    end
  end

  describe "DELETE Enemies" do
    context "when the employee exists" do
      before(:each) { delete "/employees/#{employee.id}" }

      it 'returns status code 204' do
        expect(response).to have_http_status(204) 
      end

      it 'destroy the record' do
        expect{ employee.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end

  end

end
