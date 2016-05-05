ActiveAdmin.register Galery do

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

permit_params :category_id, :titulo, :descripcion, :posicion, :portada, :visible

active_admin_importable

index do
  selectable_column
  column :category_id
  column :titulo
  column :descripcion
  column :posicion
  column :portada
  column :visible
  actions
end

end
