ActiveAdmin.register DoctorProfile do

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
permit_params :available, :cmp, :last_name
actions :all, except: [:new, :create, :destroy]

  index do
    id_column
    column "Disponible", :available
    column "Apellido", :last_name
    column "CMP", :cmp
    column "Creada", :created_at
    column "Actualizada", :updated_at
    actions
  end

  filter :available
  filter :last_name
  filter :cmp

end
