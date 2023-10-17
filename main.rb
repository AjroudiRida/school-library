require_relative 'app'
require_relative 'menu'
require_relative 'validate_input'

def main
  puts "\nWelcome to School Library App!\n"

  app = App.new
  menu = Menu.new(app)

  loop do
    menu.display
    option = user_input('int')

    break if option == 7

    menu.process_option(option)
  end
  puts 'Thank you for using the app!'
end

main
