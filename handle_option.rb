module HandleOption
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
end
