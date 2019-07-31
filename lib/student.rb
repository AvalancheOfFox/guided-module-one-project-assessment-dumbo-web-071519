class Student < ActiveRecord::Base 
    include Find_By
    has_many :lessons
    has_many :tutors, through: :lessons


    def self.returning_user_handler
        puts "What is your name?"
        name = gets.chomp
        
        student_object = Student.find_by(name: name) 
        if student_object == nil || student_object == " "
            puts "Please enter a name already in our database."
            self.returning_user_handler
        end  #loops to check if name is valid and in db
        student_object
    end

    def change_subject
        puts "What is your newest intellectual pursuit?"
        self.subject =  gets.chomp
        puts "Your new subject is : #{self.subject}."
        sleep(1.5)
        puts "______________________________________________________________________________________________________________________________________"
        puts " "
        puts" O       o OooOOo.  o.OOOo.      Oo    oOoOOoOOo o.OOoOoo       .oOOOo.  O       o  .oOOOo.   .oOOOo.  o.OOoOoo .oOOOo.  .oOOOo.  
o       O O     `O  O    `o    o  O       o      O             o     o  o       O .O     o  .O     o   O       o     o  o     o  
O       o o      O  o      O  O    o      o      o             O.       O       o o         o          o       O.       O.       
o       o O     .o  O      o oOooOoOo     O      ooOO           `OOoo.  o       o o         o          ooOO     `OOoo.   `OOoo.  
o       O oOooOO'   o      O o      O     o      O                   `O o       O o         o          O             `O       `O 
O       O o         O      o O      o     O      o                    o O       O O         O          o              o        o 
`o     Oo O         o    .O' o      O     O      O             O.    .O `o     Oo `o     .o `o     .o  O       O.    .O O.    .O 
 `OoooO'O o'        OooOO'   O.     O     o'    ooOooOoO        `oooO'   `OoooO'O  `OoooO'   `OoooO'  ooOooOoO  `oooO'   `oooO'  "
        sleep (2)
    end

    def change_location
        puts "Where have your travels taken you?"
        self.location =  gets.chomp
        puts "Your new flesh prison coordinates are in #{self.location}."
        sleep(1.5)
        puts "______________________________________________________________________________________________________________________________________"
        puts " "
        puts" O       o OooOOo.  o.OOOo.      Oo    oOoOOoOOo o.OOoOoo       .oOOOo.  O       o  .oOOOo.   .oOOOo.  o.OOoOoo .oOOOo.  .oOOOo.  
o       O O     `O  O    `o    o  O       o      O             o     o  o       O .O     o  .O     o   O       o     o  o     o  
O       o o      O  o      O  O    o      o      o             O.       O       o o         o          o       O.       O.       
o       o O     .o  O      o oOooOoOo     O      ooOO           `OOoo.  o       o o         o          ooOO     `OOoo.   `OOoo.  
o       O oOooOO'   o      O o      O     o      O                   `O o       O o         o          O             `O       `O 
O       O o         O      o O      o     O      o                    o O       O O         O          o              o        o 
`o     Oo O         o    .O' o      O     O      O             O.    .O `o     Oo `o     .o `o     .o  O       O.    .O O.    .O 
 `OoooO'O o'        OooOO'   O.     O     o'    ooOooOoO        `oooO'   `OoooO'O  `OoooO'   `OoooO'  ooOooOoO  `oooO'   `oooO'  "
        sleep (2)
    end

    def vanity_check
        puts "What a vain pupil. Your details are as follows:"
        puts "Location: #{self.location}"
        puts "Subject: #{self.subject}"
        puts "Grade: #{self.grade}"
        puts "______________________________________________________________________________________________________________________________________"
        puts " "
        puts "#     # ####### #######     #####  ####### #     # ######  ####### #     # #######     #####  #     # #     # #     # ####### ######  
#     # #     #    #       #     #    #    #     # #     # #       ##    #    #       #     # #     # ##   ## ##   ## #       #     # 
#     # #     #    #       #          #    #     # #     # #       # #   #    #       #       #     # # # # # # # # # #       #     # 
####### #     #    #        #####     #    #     # #     # #####   #  #  #    #        #####  #     # #  #  # #  #  # #####   ######  
#     # #     #    #             #    #    #     # #     # #       #   # #    #             # #     # #     # #     # #       #   #   
#     # #     #    #       #     #    #    #     # #     # #       #    ##    #       #     # #     # #     # #     # #       #    #  
#     # #######    #        #####     #     #####  ######  ####### #     #    #        #####   #####  #     # #     # ####### #     #"
        sleep(3)


    end

    
end

    # def name_validator    #not used anywhere yet but would standardize our names as Capitalized and all letters
    #     prompt.ask("What is your name?") do |q|
    #     q.required true
    #     q.validate /\A\w+\Z/
    #     q.modify   :capitalize
    # end