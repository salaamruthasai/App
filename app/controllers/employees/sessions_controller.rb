# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  respond_to :json
  private

 def respond_with(resource, options={})
    render json:{
      status: { code: 200 ,message: "user signed in successsfully" , data: current_employee} 
    }
 end

 def respond_to_on_destroy
    jwt_payload=JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first

   
    
    current_employee=Employee.find(jwt_payload['sub'])
    if current_employee
      render json:{
        status: 200,
        message: "Signed out Successfully"
      },status: :ok
    else
      render json: {
        status: 401,
        message: "User has no active session"
      },status: :unauthorized
    end

 end
end
