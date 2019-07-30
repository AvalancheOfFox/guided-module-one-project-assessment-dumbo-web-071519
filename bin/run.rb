require_relative '../config/environment'


cli = Interface.new
user_object = cli.welcome
cli.second_menu(user_object)

binding.pry
puts "hello world"
