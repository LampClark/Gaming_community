class RegistrationsController < Devise::RegistrationsController
  def update
    super do |resource|
      # Add any additional logic or actions you need here

      # Redirect or render as per your requirements
      if resource.errors.empty?
        redirect_to profile_path(resource)
      else
        render :edit
      end
    end
  end

  private

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password) # Add any other attributes you want to update
  end
end
