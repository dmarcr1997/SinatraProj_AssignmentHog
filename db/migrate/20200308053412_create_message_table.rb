class CreateMessageTable < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string  :message
      t.integer :student1_id
      t.integer :student2_id
    end 
  end
end
