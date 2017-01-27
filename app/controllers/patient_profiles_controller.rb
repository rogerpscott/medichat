class PatientProfilesController < ApplicationController
  def edit
    @patient_profile = current_user.patient_profile
  end

  def update
    @patient_profile = current_user.patient_profile
    if @patient_profile.update(patient_profile_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def accept_terms
    @patient_profile = current_user.patient_profile
    @patient_profile.update(patient_profile_params)
    redirect_to root_path
  end

  private

  def patient_profile_params
    params.require(:patient_profile).permit(:first_name, :last_name, :dni, :phone, :birthday, :sex, :blood_type, :existing_conditions, :allergies, :height, :weight, :terms)
  end
end
