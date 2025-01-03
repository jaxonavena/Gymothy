class EmployeesController < ApplicationController
  before_action :set_business
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = @business.employees.new
  end

  def edit
  end

  def create
    @employee = @business.employees.new(employee_params)

    if @employee.save
      redirect_to business_employee_path(@business, @employee)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    @employee.destroy!
  end

  private

  def set_business
    @business = Business.find(params[:business_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_params
    params.require(:employee).permit(:name, :role)
  end
end
