class RepliesController < ApplicationController
  before_action :set_channel_and_discussion
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def create
    @reply = @discussion.replies.build(reply_params)
    @reply.user = current_user

    respond_to do |format|
      if @reply.save
        format.html { redirect_to channel_discussion_path(@channel, @discussion), notice: 'Reply was successfully created.' }
        format.json { render json: { status: 'success', reply: render_to_string(partial: 'replies/reply', locals: { reply: @reply }) } }
      else
        format.html { redirect_to channel_discussion_path(@channel, @discussion), alert: 'There was an error creating your reply.' }
        format.json { render json: { status: 'error', errors: @reply.errors.full_messages } }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to channel_discussion_path(@channel, @discussion), notice: 'Reply was successfully updated.' }
        format.json { render json: { status: 'success', reply: render_to_string(partial: 'replies/reply', locals: { reply: @reply }) } }
      else
        format.html { render :edit }
        format.json { render json: { status: 'error', errors: @reply.errors.full_messages } }
      end
    end
  end

  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to channel_discussion_path(@channel, @discussion), notice: 'Reply was successfully deleted.' }
      format.json { render json: { status: 'success' } }
    end
  end

  private

  def set_channel_and_discussion
    @channel = Channel.friendly.find(params[:channel_slug])
    @discussion = @channel.discussions.friendly.find(params[:discussion_slug])
  end

  def set_reply
    @reply = @discussion.replies.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:content)
  end
end
