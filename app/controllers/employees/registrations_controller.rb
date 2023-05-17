# frozen_string_literal: true

class Employees::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  respond_to :json

  private
    
  def respond_with(resource, options={})
  if resource.persisted?
    render json:{
      status: {code: 200, message: 'Signed up successfully' , data: resource} 
    }
  else
    render json: {
      status: {message: 'User could not be created', errors: resource.errors.full_messages}, status: :unprocessable_entity
    }
  end
  end
end
