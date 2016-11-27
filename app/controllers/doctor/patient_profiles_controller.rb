class Doctor::PatientProfilesController < ApplicationController
  def show
    @conversation = Conversation.find_by(access_token: params[:access_token])
    @patient_profile = @conversation.patient.patient_profile
  end
end
