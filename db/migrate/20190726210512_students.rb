class Students < ActiveRecord::Migration[5.2]
  def change 
    create_table :students do |t|
    t.string :name
    t.integer :grade
    t.string :subject
    t.string :location
    end
  end
end
