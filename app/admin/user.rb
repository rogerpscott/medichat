ActiveAdmin.register User do

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


permit_params :email, :password
actions :all, except: [:new, :create, :destroy]

  index do
    id_column
    column "Correo", :email
    actions
  end

filter :id, as: :select, collection: [['1', '8'], ['2', '9'], ['3', '10']]

  form do |f|
    f.inputs "Edit" do
      f.input :email
      f.input :password
      f.submit
    end
  end


end
