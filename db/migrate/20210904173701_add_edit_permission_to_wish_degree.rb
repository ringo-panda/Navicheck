class AddEditPermissionToWishDegree < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_degrees, :edit_permission, :boolean, default: true
    add_column :selection_statuses, :edit_permission, :boolean, default: true
    add_column :event_categories, :edit_permission, :boolean, default: true
  end
end
