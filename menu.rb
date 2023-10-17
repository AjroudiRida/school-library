require_relative 'app'
require_relative 'display_menu'

class Menu
  def initialize(app)
    @app = app
    @display = DisplayMenu.new
  end

  def process_option(option)
    case option
    when 1
      @app.book_list
    when 2
      @app.people_list
    when 3
      @app.create_a_person
    when 4
      @app.create_a_book
    when 5
      @app.create_a_rental
    when 6
      @app.list_all_rentals_for_person_id
    when 7
      puts "Thank you for using the app!"
    else
      puts "Invalid option. Please try again."
    end
  end

  def display
    @display.show_menu
  end
end
