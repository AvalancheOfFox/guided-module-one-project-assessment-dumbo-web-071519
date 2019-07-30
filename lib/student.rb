class Student < ActiveRecord::Base 
    include Find_By
    has_many :lessons
    has_many :tutors, through: :lessons

    def name_validator    #not used anywhere yet but would standardize our names as Capitalized and all letters
        prompt.ask("What is your name?") do |q|
        q.required true
        q.validate /\A\w+\Z/
        q.modify   :capitalize
    end
    end

    def self.returning_user_handler
        puts "What is your name?"
        name = gets.chomp
        student_object = Student.find_by(name: name) 
        if student_object == nil
            self.returning_user_handler
        end  #loops to check if name is valid and in db
        student_object
    end

   
end