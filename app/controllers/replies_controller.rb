# Ye controller replies ki sari functionalities handle krta hai
# Jaise k new reply banana, edit krna, delete krna, etc.
class RepliesController < ApplicationController
  # User ko login hona zaruri hai kisi bhi action k liye
  before_action :authenticate_user!
  # Discussion dhundta hai jis par reply krni hai
  before_action :set_discussion
  # Specific reply ko dhundta hai edit/update/delete k liye
  before_action :set_reply, only: [:edit, :update, :destroy]
  # Check krta hai k user authorized hai ya nahi edit/update/delete k liye
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # Nayi reply create krta hai
  def create
    @reply = @discussion.replies.create(params[:reply].permit(:reply, :discussion_id))
    @reply.user_id = current_user.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to discussion_path(@discussion), notice: '✨ Reply was successfully created!' }
        format.js
      else
        format.html { redirect_to discussion_path(@discussion), alert: '⚠️ Reply could not be created.' }
        format.js
      end
    end
  end

  # Reply ko edit krne ka form
  def edit
  end

  # Existing reply ko update krta hai
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to discussion_path(@discussion), notice: '✨ Reply was successfully updated!' }
      else
        format.html { render :edit }
      end
    end
  end

  # Reply ko delete krta hai
  def destroy
    @reply.destroy
    redirect_to discussion_path(@discussion), notice: '✨ Reply was successfully deleted!'
  end

  private

  # Discussion ko dhundta hai jis par reply ki gai hai
  def set_discussion
    @discussion = Discussion.find(params[:discussion_id])
  end

  # Reply ko database se dhundta hai ID k through
  def set_reply
    @reply = @discussion.replies.find(params[:id])
  end

  # Form se ane wali values ko filter krta hai security k liye
  def reply_params
    params.require(:reply).permit(:reply)
  end

  # Check krta hai k user admin hai ya reply ka owner hai
  def authorize_user!
    unless current_user.admin? || @reply.user == current_user
      redirect_to discussion_path(@discussion), alert: '⚠️ You are not authorized to perform this action!'
    end
  end
end

