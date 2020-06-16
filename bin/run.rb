require 'pry'
require_relative '../config/environment'

def welcome
    puts "Please select from the menu below using only the list number."
end

def main_menu_functions
    return ["Team functions", "Game functions", "Player functions", "Exit"]
end

def print_main_menu(menu)
    menu.each_with_index do |value, index|
        puts "#{index + 1}. #{value}"
    end
end

def get_user_input(menu)
    input = gets.chomp().to_i

    if input.is_a?(Integer) && input.between?(1,menu.count)
        return input
    else
        puts "Please enter a number between 1 and #{menu.count}."
        get_user_input(menu)
    end
end

# def get_team_functions
# end

# def get_player_functions
# end

# def get_team_functions
# end

# def exit
# end

welcome

# while true
#     menu = main_menu_functions
#     print_main_menu(menu)
#     case get_user_input(menu)
#     when 1
#         get_team_functions
    
#     when 2
#         get_game_functions

#     when 3
#         get_player_functions

#     end
# end
