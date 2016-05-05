ActiveAdmin.register Foto do

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

permit_params :galery_id, :image, :titulo, :descripcion, :posicion, :visible
# si falla probar a quitar la FK :galery_id

active_admin_importable

index do
  selectable_column
  column :galery_id
  column :image
  column :titulo
  column :descripcion
  column :posicion
  column :visible
  actions
end

end
