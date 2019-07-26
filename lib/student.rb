class Student < ActiveRecord::Base 
    has_many :lessons
    has_many :tutors, through: :lessons
end