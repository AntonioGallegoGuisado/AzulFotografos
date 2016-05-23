ActiveAdmin.register Category do

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

permit_params :titulo, :descripcion, :posicion, :visible, :image

active_admin_importable

form partial: 'form'
form :html => { :enctype => "multipart/form-data" } do |f|
    f.input :titulo
    f.input :descripcion
    f.input :posicion
    f.input :visible
    f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:small))
    actions
end

index do
  selectable_column
  column :titulo
  column :descripcion
  column :visible
  column :image
  actions
end

end
