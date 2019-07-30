require_relative '../config/environment'


cli = Interface.new
user_object = cli.welcome
choice = cli.second_menu(user_object)
while choice != "Exit"
    choice = cli.second_menu(user_object)
end

binding.pry
puts "Goodbye CRuel World"
