class ChangeMessageCol2Name < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :student1_id, :student_id
    rename_column :messages, :student2_id, :recipient
  end
end
