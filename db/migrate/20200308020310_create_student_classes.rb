class CreateStudentClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :stuclas do |t|
      t.string  :name
    end
  end
end
