require_relative 'app'

class Main
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

  def handle_option(option)
    case option
    when 1 then @app.book_list
    when 2 then @app.people_list
    when 3 then @app.create_a_person
    when 4 then @app.create_a_book
    when 5 then @app.create_a_rental
    when 6 then @app.list_all_rentals_for_person_id
    when 7 then exit_app
    end
  end

  def handle_invalid_option
    puts 'Invalid option. Please enter a number between 1 and 7.'
    show_options
    choose_option
  end

  def choose_option
    option = gets.chomp.to_i

    if option >= 1 && option <= 7
      handle_option(option)
      show_options unless option == 7
      choose_option unless option == 7

    else
      handle_invalid_option
    end
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end
end

main = Main.new
main.show_options
main.choose_option
