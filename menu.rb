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
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals
    when 7
      puts 'Thank you for using the app!'
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def display
    @display.show_menu
  end
end
