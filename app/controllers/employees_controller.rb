class EmployeesController < ApplicationController
  before_action :authenticate_employee!

  # def  
  #   employee=Employee.find(params[:id])
  #   if employee.manager_action
  #     emp=employee.subordinates
  #    render json: emp,status:200

   
  #   else
  #     render json: "not authorized person"
  # end


end
end