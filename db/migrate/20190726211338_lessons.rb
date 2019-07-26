class Lessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :student_id
      t.integer :tutor_id
    end
  end
end
