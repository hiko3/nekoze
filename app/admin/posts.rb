ActiveAdmin.register Post do

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
   column :title
   column :body
   column :image do |post|
     attachment_image_tag post, :image, :fill, 100, 100
   end
   column :catname
   column :created_at
   column :updated_at
   actions
  end

  show do
    attributes_table do
      row :title
      row :body
      row :image do |post|
        attachment_image_tag post, :image, :fill, 200, 200
      end
      row :catname
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.attachment_field :image
      f.input :body
      f.input :catname
    end
    f.semantic_errors
    f.actions
  end

permit_params :title, :body, :image, :catname

end
