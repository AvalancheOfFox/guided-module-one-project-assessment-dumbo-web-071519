class Tutors < ActiveRecord::Migration[5.2]
  def change
    create_table :tutors do |t|
      t.string :name
      t.string :field
      t.string :location
    end
  end
end
