class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show]

  def index
    @channels = Channel.ordered
  end

  def show
    @discussions = @channel.discussions
                          .includes(:user, :replies)
                          .pinned_first
                          .page(params[:page])
                          .per(20)
  end

  private

  def set_channel
    @channel = Channel.friendly.find(params[:slug])
  end
end