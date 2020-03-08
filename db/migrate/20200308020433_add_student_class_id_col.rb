class AddStudentClassIdCol < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :stucla_id, :integer
  end
end
