ActiveAdmin.register Conversation do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :access_token, :doctor, :patient, :messages
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  actions :all, except: [:new, :create, :edit, :update, :destroy]

  controller do
    def find_resource
      begin
        scoped_collection.where(id: params[:access_token]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find_by(access_token: params[:id])
      end
    end
  end

  index do
    id_column
    column "Nombre del paciente" do |c|
      c.patient.patient_profile.first_name
    end
    column "Apellido del paciente" do |c|
      c.patient.patient_profile.last_name
    end
    column "Doctor" do |c|
      c.doctor.doctor_profile.last_name
    end
    column "Estatus", :status
    column "Resumen", :summary
    column "Diagnostico", :diagnosis
    column "Creada", :created_at
    column "Actualizada", :updated_at
    actions
  end

  show do
    render partial: 'messages/message', collection: conversation.messages
  end

filter :status, as: :select, collection: [['Abiertas', 'open'], ['Terminadas', 'closed']]
filter :updated_at

end
