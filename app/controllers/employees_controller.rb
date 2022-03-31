class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]
  before_action :set_employees_for_api, only: %i[getting_data_for_api]

  def index
    @employees = Employee.order(id: :desc).page(params[:page])
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.avatar = params[:file]
    if @employee.save
      redirect_to @employee, notice: "Employee was created successfully"
    else
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee was successfully updated"
    else
      render :edit
    end
  end

  def getting_data_for_api
    @array_employees[0].each do |employee|
      Employee.create(
        title: employee['name']['title'],
        firstname: employee['name']['first'],
        lastname: employee['name']['last'],
        email: employee['email'],
        gender: employee['gender']
      )
    end
    redirect_to root_path, notice: "Data was saved successfully"
  end

  def destroy
    @employee.remove_avatar!
    @employee.destroy

    redirect_to employees_url, notice: "Employee was successfully destroyed."
  end

  private

  # GET the data from the external api
  def set_employees_for_api
    resp = RestClient.get("https://randomuser.me/api?format=json&results=30&inc=gender,name,email,picture&nat=br&seed=giga")
    @array_employees = Employee.all.to_ary
    @array_employees << JSON.parse(resp.body)["results"]
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:title, :firstname, :lastname, :email, :gender, :avatar)
  end
end
