class Student < ActiveRecord::Base 
    include Find_By
    has_many :lessons
    has_many :tutors, through: :lessons

    def self.new_user_setup
        puts "What is your name my Seeker of Knowledge?"
        name = gets.chomp
        puts "And of what grade are you?"
        grade = gets.chomp
        puts "In what subject do wish to receive instruction?"
        subject = gets.chomp
        puts "And where on the Earthly plane are you located?"
        location = gets.chomp
        new_student = Student.create(:name => name, :grade => grade, :subject => subject, :location => location)
        puts "Welcome to Studify where we bring you from the dark, cold of ignorance into the warmth of knowledge."
        Interface.second_menu(new_student)
        #returns the new student we create (implicit)
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