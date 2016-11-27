class ConversationsController < ApplicationController

  def home
  end

  def index
    @conversations = Conversation.where(patient: current_user)
  end

  def new
    @conversation = Conversation.new
  end



  def create
    open_conversation = Conversation.find_by(patient: current_user, status: "open")
    available_doctors = Doctor.joins(:doctor_profile).where(doctor_profiles: {available: true})
    if available_doctors == []
      redirect_to root_path, alert: "En este momento no hay doctores disponibles, por favor intenta de nuevo en unos minutos."
    elsif open_conversation.nil? || open_conversation.doctor.doctor_profile.available == false
      @conversation = Conversation.new()
      @conversation.patient = current_user
      sorted_available_doctors = available_doctors.sort_by do |d|
        Conversation.where(doctor: d, status: "open").length
      end
      @conversation.doctor = sorted_available_doctors.first
      @conversation.status = "open"
      if @conversation.save
        respond_to do |format|
          format.html { redirect_to conversation_path(@conversation) }
          format.js
        end
      end
    else
      redirect_to conversation_path(open_conversation)
    end
  end

  def show
    @conversation = Conversation.find_by(access_token: params[:access_token])
    @message = Message.new
    respond_to do |format|
      format.html
      format.js
    end
  end


   def update
    @conversation = Conversation.find_by(access_token: params[:access_token])
    @conversation.update(conversation_params)
    @conversation.status = "closed"
    if @conversation.diagnosis.length < 5 or @conversation.summary.length < 5
      flash[:alert] = "Mínimo 5 carácteres"
      redirect_to edit_doctor_conversation_path(@conversation)
    else
      @conversation.save
      redirect_to doctor_conversations_path
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:diagnosis, :summary)
  end
end
