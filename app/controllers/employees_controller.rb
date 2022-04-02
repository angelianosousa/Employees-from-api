class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[edit update destroy]
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
    @employee.avatar = params[:file] if params[:file]
    if @employee.save
      redirect_to employees_path, notice: "Employee was created successfully"
    else
      render :new
    end
  end

  def update
    @employee.avatar = params[:file] if params[:file]
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "Employee was successfully updated"
    else
      render :edit
    end
  end

  # Action for add data from the external API
  def getting_data_for_api
    @array_employees.each do |employee|
      new_employee = Employee.new(
        title: employee['name']['title'],
        firstname: employee['name']['first'],
        lastname: employee['name']['last'],
        email: employee['email'],
        gender: employee['gender'],
      )
      new_employee.remote_avatar_url = employee['picture']['large']
      new_employee.save!
    end

    redirect_to root_path, notice: "Data was saved successfully"
  end

  def destroy
    @employee.remove_avatar! if @employee.avatar? # To destroy the picture from employee
    if @employee.destroy
      redirect_to employees_path, notice: "Employee was successfully destroyed."
    else
      redirect_to employees_path, error: "There's no employee with this id"
    end
  end

  private

  # GET the data from the external api
  def set_employees_for_api
    resp = RestClient.get("https://randomuser.me/api?format=json&results=30&inc=gender,name,email,picture&nat=br&seed=giga")
    @array_employees = JSON.parse(resp.body)["results"]
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:title, :firstname, :lastname, :email, :gender, :avatar)
  end
end
