class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end

  def after_sign_up_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      root_path
    end
  end

end