module Find_By 
 def find_tutor
    puts "Please enter a tutor's name to search for:"
    name = gets.chomp
    tutor = Tutor.all.find{|tutor| tutor.name == name}
    # puts "You have sought out #{tutor.name}"
    #returns whole tutor instance with matching name
    tutor ? (puts "Seeker by name of #{self.name}, we have found a tutor near you. Meet #{tutor.name}. They are an educator of #{tutor.field}. Learn well.") : (puts "Sorry #{name} is not a tutor on our roster")
    sleep(3)
 end

  def find_student(name)
    Student.all.find{|stud| stud.name == name}
  end

    def opposite_class_Selector  #if self.class = Student, returns all Tutors. If self.class == Tutor, returns all Students. 
        if self.class == Tutor
            Student.all.select{|student| student}
        elsif self.class == Student
            Tutor.all.select{|tutor| tutor}
        else
            puts "Do you even go here bro?"
        end
    end

    def find_obj_by_location #gets back tutor objs with matched location to the student instance location.  
        # binding.pry
        self.opposite_class_Selector.select{|opp| opp.location == self.location }
        
    end

  def tutor_name_by_location  #returns a string of tutor names i.e fed a student, returns a tutor/s as an array of strings
    # binding.pry
    tutor_array = find_obj_by_location
    t_name_arr = tutor_array.map{|t| t.name} 
    t_strings = t_name_arr.join(" & ") 
    puts "The tutors near your location are #{t_strings}."
    sleep(1)
  end

  def find_by_subject  #checks for self subject offered to teach or subject tutoring wanted, and returns matches from the opposite class 
     self.attributes.has_key?("field") ? (self.opposite_class_Selector.select{|opp| opp.subject == self.field}) : (self.opposite_class_Selector.select{|opp| opp.field == self.subject}) 
     sleep(1)   
  end
  
  
#   def find_by_subject
#     if find_by_location && self.subject

#     end
#   end
  



    
    
end  