class Doctor::ConversationsController < ApplicationController

  def index
    @conversations = Conversation.where(status: "open", doctor: current_user)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index_new
    all_conversations = Conversation.where(status: "open", doctor: current_user)
    @conversations = []
    all_conversations.each do |c|
      has_doc_msg = c.messages.select { |m| m.user.class == Doctor }
      if has_doc_msg.empty?
        @conversations << c
      end
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  helper_method :index_new

  def index_old
    all_conversations = Conversation.where(status: "open", doctor: current_user)
    @conversations = []
    all_conversations.each do |c|
      has_doc_msg = c.messages.select { |m| m.user.class == Doctor }
      if has_doc_msg.any?
        @conversations << c
      end
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  helper_method :index_old

  def show
    @conversation = Conversation.find_by(access_token: params[:access_token])
    @message = Message.new
  end

  def edit
    @conversation = Conversation.find_by(access_token: params[:access_token])
  end

  def update
    @conversation = Conversation.find_by(access_token: params[:access_token])
    @conversation.update(conversation_params)
    @conversation.status = "closed"
    if @conversation.diagnosis.length < 5 or @conversation.summary.length < 5
      flash[:notice] = "Post can not be saved, please enter information."
      redirect_to edit_doctor_conversation_path(@conversation)
    else
      @conversation.save
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:diagnosis, :summary)
  end
end
