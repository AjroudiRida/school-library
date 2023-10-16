module ChooseOption
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
end
