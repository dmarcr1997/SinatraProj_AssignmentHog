class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string  :name
      t.string  :class
      t.datetime  :due_date
      t.integer   :student_id
    end
  end
end
