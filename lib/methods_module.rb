module Find_By 
 def find_tutor(name)
   tutor = Tutor.all.find{|tutor| tutor.name == name}
    puts "You have sought out #{tutor.name}"

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

    def find_obj_by_location
        self.opposite_class_Selector.select{|opp| opp.location == self.location }
    end

  def find_by_location  #matches our location on whoever called on for their opposite i.e fed a student, returns a tutor/s as an array of strings
    tutor_array = self.opposite_class_Selector.select{|opp| opp.location == self.location }
    t_name_arr = tutor_array.map{|t| t.name}  
    puts "The tutors near your location are #{t_name_arr.map{|t| t.name}.join(" & ")}."
  end

  def find_by_subject  #checks for self subject offered to teach or subject tutoring wanted, and returns matches from the opposite class 
     self.attributes.has_key?("field") ? (self.opposite_class_Selector.select{|opp| opp.subject == self.field}) : (self.opposite_class_Selector.select{|opp| opp.field == self.subject})    
  end
  
  
#   def find_by_subject
#     if find_by_location && self.subject

#     end
#   end
  



    
    
end  