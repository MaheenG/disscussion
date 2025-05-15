class AdminPermissionsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @permissions = AdminPermission.all
  end

  def new
    @permission = AdminPermission.new
  end

  def create
    @permission = AdminPermission.new(admin_permission_params)
    if @permission.save
      redirect_to admin_permissions_path
    else
      render :new
    end
  end

  def destroy
    @permission = AdminPermission.find(params[:id])
    @permission.destroy
    redirect_to admin_permissions_path
  end

  private

  def admin_permission_params
    params.require(:admin_permission).permit(:admin_id, :discussion_id, :reply_id, :action_type)
  end

  def authenticate_admin!
    redirect_to root_path, alert: "Not authorized" unless current_user&.admin?
  end
end
