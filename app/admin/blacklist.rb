ActiveAdmin.register Blacklist do
  permit_params :user_id, :reason, :banned_at, :ban_duration, :is_permanent

  index do
    selectable_column
    id_column
    column :user_id
    column :reason
    column :banned_at
    column :ban_duration
    column :is_permanent
    actions
  end

  filter :user
  filter :reason
  filter :banned_at
  filter :ban_duration
  filter :is_permanent

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map { |u| [u.email, u.id] }
      f.input :reason
      f.input :banned_at, as: :datepicker
      f.input :ban_duration, as: :datepicker
      f.input :is_permanent
    end
    f.actions
  end
end

