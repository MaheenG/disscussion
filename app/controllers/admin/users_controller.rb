module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin
    before_action :set_user, only: [:edit, :update, :destroy]
    layout 'admin'

    def index
      @users = User.all.order(created_at: :desc)
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def update
      if user_params[:password].blank?
        user_params.delete(:password)
        user_params.delete(:password_confirmation)
      end

      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully deleted.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin)
    end

    def check_admin
      unless current_user&.admin?
        redirect_to root_path, alert: 'You are not authorized to access this area.'
      end
    end
  end
end 