class AddTimeAndLocationToLessons < ActiveRecord::Migration[5.2]
  def change
     add_column(:lessons, :time, :string)
     add_column(:lessons, :location, :string)
  end
end
