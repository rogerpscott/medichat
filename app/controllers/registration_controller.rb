class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_in_path_for(resource)
    # check for the class of the object to determine what type it is
    if resource.class == Doctor
      doctor_conversations_path
    elsif resource.class == Patient
      root_path
    end
  end

end
