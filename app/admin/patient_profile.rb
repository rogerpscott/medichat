ActiveAdmin.register PatientProfile do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
actions :all, except: [:new, :create, :edit, :update, :destroy]

  index do
    id_column
    column "Nombre", :first_name
    column "Apellido", :last_name
    column "DNI", :dni
    column "Telefono", :phone
    column "Acepto terminos", :terms
    column "Creada", :created_at
    column "Actualizada", :updated_at
    actions
  end

end
