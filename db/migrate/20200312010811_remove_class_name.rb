class RemoveClassName < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :class_name
  end
end
