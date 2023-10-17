require_relative 'app'
require_relative 'menu'

def main
  puts "\nWelcome to School Library App!\n"

  app = App.new
  menu = Menu.new(app)

  loop do
    menu.display
    option = gets.chomp.to_i

    break if option == 7

    menu.process_option(option)
  end
  puts 'Thank you for using the app!'
end

main
