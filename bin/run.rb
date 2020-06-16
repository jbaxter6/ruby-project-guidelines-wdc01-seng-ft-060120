require 'pry'
require_relative '../config/environment'
require_relative 'team_functions.rb'

def welcome
    puts "Please select from the menu below using only the list number."
end

def get_menu_selections(type)
    case type
    when "Main"
      return ["Team functions", "Player functions", "Game functions", "Exit the program"]
    when "Team"
      return ["Get all teams", "Search team by name", "Search team by city", "Add team", "Delete team"]
    when "Player"
      return ["Get all players"]
    when "Game"
      return ["Get all games"]
    end
end
  
def print_menu(menu)
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

#Welcome to user
welcome

# Print out the main menu, and get their input
menu = get_menu_selections("Main")
print_menu(menu)
input = get_user_input(menu)

# Determining which menu
case input
when 1
    menu = get_menu_selections("Team")
    print_menu(menu)
    input = get_user_input(menu)

    case input
    when 1 # Get all teams
        get_all_teams
    when 2 # Search team by name
        search_team_by_name
    when 3 # Search team by city
        search_team_by_city
    when 4 # add team
        puts add_team
    end

when 2
    menu = get_menu_selections("Player")
    print_menu(menu)
    input = get_user_input(menu)

when 3
    menu = get_menu_selections("Game")
    print_menu(menu)
    input = get_user_input(menu)

end
