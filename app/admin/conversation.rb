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

  controller do
    def find_resource
      begin
        scoped_collection.where(id: params[:access_token]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find_by(access_token: params[:id])
      end
    end
  end

  show do
    render partial: 'messages/message', collection: conversation.messages
  end

end
