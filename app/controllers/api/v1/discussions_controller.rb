class Api::V1::DiscussionsController < Api::V1::BaseController
  def index
    @discussions = Discussion.includes(:user, :channel, :replies).ordered
    render json: @discussions.as_json(include: [:user, :channel, :replies])
  end

  def show
    @discussion = Discussion.includes(:user, :channel, :replies).friendly.find(params[:id])
    render json: @discussion.as_json(include: [:user, :channel, :replies])
  end
end