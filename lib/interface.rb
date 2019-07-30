class Interface
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "🔮  Welcome to Studify, my diligent pupil 🔮"
        prompt.select("Are you looking for tutoring young one? Or have you already a tutor?") do |menu|
            menu.choice "New Student", -> {self.new_user_setup}
            menu.choice "Returning Student", -> {Student.returning_user_handler}
            #menu.choice "Exit", -> {exit function tbw}
            # [ New User, Returning User, Exit ] 
        end
    end

        def new_user_setup 
        name = prompt.ask("What is your name my Seeker of Knowledge?", default: 'Anonymous')
        grade = prompt.ask("And of what grade are you?")
        subject = prompt.ask("In what subject do you require instruction?")
        location = prompt.ask("Where is your flesh prison located?")
        puts "Welcome to Studify where we bring you from the dark, cold of ignorance into the warmth of knowledge."
        new_stud = Student.create(:name => name, :grade => grade, :subject => subject, :location => location)
       
        #returns the new student we create (implicit)
        end

    def second_menu(student_object)
    binding.pry
    chosen_option = prompt.select("Welcome back #{student_object.name}. What do you wish to do today?") do |menu|
           
        menu.choice  "Search By Name" , -> { puts "Please enter a tutor's name to search for:"
            name = gets.chomp
            return student_object.find_tutor(name) }

            menu.choice  "See Tutors Near Your Location" , -> { return student_object.find_obj_by_location.select{|t| t.name} } 

            menu.choice  "Book A New Lesson" , -> {help_me_book(student_object)} #creates new lesson instance

            menu.choice  "Cancel A Session" , -> {cancel_lesson(student_object)} #cancels the most recently created lesson
            menu.choice  "Change My Knowledge Sought" , -> {} 
            menu.choice  "Delete My Account" , -> {delete_account(student_object)} #deletes the user account and exits the program
            menu.choice  "Exit Program" , -> {return "Exit"} 
        end
    end
    
    def help_me_book(student_obj)
        chosen_tutor_str = prompt.select("Which tutor would you like to book with?", student_obj.find_obj_by_location.map{|x| x.name})
        
       
        chosen_tutor_obj = student_obj.find_obj_by_location.select{|y| y.name == chosen_tutor_str}
        # chosen_tutor = my_tutors_obj.find{|tutor_object| tutor_object.name == chosen_tutor}
        puts "When would you like to schedule your tutoring session for?"
        time = gets.chomp 
        new_lesson = Lesson.create(:student_id => student_obj.id, :tutor_id => chosen_tutor_obj[0].id, :time => time, :location => student_obj.location, :subject => student_obj.subject )
        puts "A lesson has been created between you and #{new_lesson.tutor.name} at #{new_lesson.time} in #{new_lesson.location}. Be sure to bring your #{new_lesson.subject} textbook."
        #return will be a new lesson being initialized and success measured by statement at the end
    end

    def cancel_lesson(student_obj) #cancels last created session
        lessons_arr = Lesson.all.select{|lesson| lesson.student_id == student_obj.id}
        lessons_arr.last.destroy
    end

    def delete_account(student_obj) #deletes the student obj
        the_chosen_one = Student.all.select{|stud| stud == student_obj}
        the_chosen_one.destroy
        return "Exit"
    end




end  #whole class end