ActiveAdmin.register PostReport do
  permit_params :user_id, :reason, :reported_at, :status

  index do
    selectable_column
    id_column
    column :user
    column :post
    column :reason
    column :reported_at, as: :datepicker
    column :status, as: :select, collection: PostReport.statuses.keys
    actions
  end

  filter :user
  filter :reason
  filter :reported_at
  filter :status

  form do |f|
    f.inputs do
      f.input :user
      f.input :reason
      f.input :reported_at, as: :datepicker
      f.input :status, as: :select, collection: PostReport.statuses.keys
    end
    f.actions
  end
end

