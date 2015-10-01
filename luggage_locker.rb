################################################# PROMPT ##################################################

# Write a program for managing locker reservations at a hotel concierge desk. Customers leave bags with the concierge, who then uses your program to determine in which locker to place the bag. The program tells the concierge the number of the locker in which to place the bag, and prints a ticket to give to the customer. Upon return, the customer provides the ticket, and the concierge uses that to look up the corresponding locker, retrieve the bag, and return it to the customer.
# There are 1000 small lockers, 1000 medium sized lockers, and 1000 large lockers (it’s a big Vegas hotel). You can assume that all checked bags fit into one of these three sizes. The program should​ ​always assign the smallest available locker that fits the bag.

###########################################################################################################

# user is given a prompt to check in luggage, check out luggage and exit program

# hotel has 1000 small, 1000 medium and 1000 large lockers
# hotel needs to check in luggage
# hotel needs to provide a ticket with each checked piece of luggage
# hotel needs to check out luggage based on ticket number

# locker has a locker number
# locker has a capacity (small, medium, large)
# locker has an availability value
# locker has a ticket number associated

# Always assign smallest locker?
# Handling full lockers?
# Invalid inputs?

class Hotel

  def initialize
    welcome_message
  end
 
  def welcome_message
    puts "Welcome to The Leandra Hotel"
  end

  def luggage_system
    until @current_command == 3
      display_menu
      case @current_command
      when 1
        check_in_luggage
      when 2
        check_out_luggage
      when 3 
        puts "Goodbye"
      else
        puts "Invalid entry. Please try again"
      end
    end
  end
    
  def display_menu
    puts "Please select from the following options:"
    puts "1) Check bags"
    puts "2) Claim bags"
    puts "3) Exit Application"
    puts
    @current_command = gets.chomp.to_i
  end

  def check_in_luggage
    puts "checking in?"
  end

  def generate_ticket
  end

  def print_ticket
  end

  def check_out_luggage
    puts "Checking out?"
  end

end

class Locker

  def initialize
  end

end

hotel = Hotel.new
hotel.luggage_system