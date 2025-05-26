class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discussion
  before_action :set_reply, only: [:edit, :update, :destroy]

  def create
    @reply = @discussion.replies.new(reply_params)
    @reply.user = current_user

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @discussion, notice: 'Reply was successfully created.' }
        format.js
      else
        format.html { redirect_to @discussion, alert: 'Error creating reply.' }
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @discussion, notice: 'Reply was successfully updated.' }
        format.js
      else
        format.html { redirect_to @discussion, alert: 'Error updating reply.' }
        format.js
      end
    end
  end

  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to @discussion, notice: 'Reply was successfully deleted.' }
      format.js
    end
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  def set_reply
    @reply = @discussion.replies.find(params[:id])
  end

  def reply_params
    params.require(:reply).permit(:reply)
  end
end

