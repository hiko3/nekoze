ActiveAdmin.register User do

  permit_params :name, :introduction, :profile_image

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
  index do
   selectable_column
   id_column
   column :name
   column :profile_image do |user|
     attachment_image_tag user, :profile_image, :fill, 100, 100
   end
   column :introduction
   column :created_at
   column :updated_at
   actions
  end

  show do
    attributes_table do
      row :name
      row :profile_image do |user|
        attachment_image_tag user, :profile_image, :fill, 200, 200
      end
      row :introduction
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.attachment_field :profile_image
      f.input :introduction
    end
    f.semantic_errors
    f.actions
  end

end
