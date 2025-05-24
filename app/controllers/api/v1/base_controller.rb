class Api::V1::BaseController < ActionController::API
  before_action :authenticate_user!
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end

  def access_denied
    render json: { error: 'Access denied' }, status: :forbidden
  end
end