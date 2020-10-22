# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

    # def build_resource(hash = {})
    #   hash[:uid] = User.create_unique_string
    #   super
    # end

  protected
    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def after_update_path_for(resource)
      user_path(id: current_user.id)
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :zip, :address, :profile])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :zip, :address, :profile])
    end
  end
end
