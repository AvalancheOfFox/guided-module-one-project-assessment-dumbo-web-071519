class Tutor < ActiveRecord::Base 
    include Find_By
    has_many :lessons
    has_many :students, through: :lessons
end