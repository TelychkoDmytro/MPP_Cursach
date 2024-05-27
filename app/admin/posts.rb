ActiveAdmin.register Post do
  permit_params :description, :user_id, :hoby_id, :type_id, :annotation

  filter :description
  filter :user
  filter :hoby
  filter :type
  filter :annotation

  remove_filter :images # Видалення фільтра для зображень
end
