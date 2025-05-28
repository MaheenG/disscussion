module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin
    layout 'admin'

    def index
      @discussions = Discussion.all
      @channels = Channel.all
      @users = User.all
      @replies = Reply.all
    end

    private

    def check_admin
      unless current_user&.admin?
        redirect_to root_path, alert: 'You are not authorized to access this area.'
      end
    end
  end
end 