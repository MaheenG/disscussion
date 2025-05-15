class RepliesController < ApplicationController
  def create
    @discussion = Discussion.find(params[:discussion_id])
    @reply = @discussion.replies.build(reply_params)
    @reply.user = current_user
    if @reply.save
      redirect_to @discussion
    else
      redirect_to @discussion, alert: "Reply could not be saved."
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @discussion = @reply.discussion
    @reply.destroy
    redirect_to @discussion
  end

  private

  def reply_params
    params.require(:reply).permit(:content)
  end
end
