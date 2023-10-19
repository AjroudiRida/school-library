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

    if option == 7
      app.exist_app
      break
    end

    menu.process_option(option)
  end
  puts 'Thank you for using the app!'
end

main
