require_relative 'app'
require_relative 'handle_option'
require_relative 'handle_invalid_option'
require_relative 'choose_option'
require_relative 'exit_app'

class Main
  include ExitApp
  include ChooseOption
  include HandleInvalidOption
  include HandleOption

  def initialize
    @app = App.new
  end

  def show_options
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end

main = Main.new
main.show_options
main.choose_option
