class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def employee_ajax
    @employees = Employee.all
    render json: @employees.to_json
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])

    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
    end
  end

  private

    def employee_params
      params.require(:employee).permit(:name, :surname, :full_name)
    end
end
