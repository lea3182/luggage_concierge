################################################# PROMPT ##################################################################

# Write a program for managing locker reservations at a hotel concierge desk. Customers leave bags with the concierge, who then uses your program to determine in which locker to place the bag. The program tells the concierge the number of the locker in which to place the bag, and prints a ticket to give to the customer. Upon return, the customer provides the ticket, and the concierge uses that to look up the corresponding locker, retrieve the bag, and return it to the customer.
# There are 1000 small lockers, 1000 medium sized lockers, and 1000 large lockers (it’s a big Vegas hotel). You can assume that all checked bags fit into one of these three sizes. The program should​ ​always assign the smallest available locker that fits the bag.

############################################################################################################################

################################################ PSEUDOCODE ################################################################

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
# Invalid inputs for luggage program, bag size, ticket

############################################################################################################################

# require "awesome_print"

# ASSUMPTIONS : All lockers hold 1 bag. 1 bag per check in.

class Hotel

  def initialize
    welcome_message
    @lockers = {}
    initialize_lockers
  end

  def welcome_message
    puts
    puts "Welcome to the Luggage Concierge 5000"
    puts
  end

  def initialize_lockers
    1000.times do |key|
      @lockers[key] = Locker.new(number: key, capacity: :small)
      @lockers[key+1000] = Locker.new(number: key+1000, capacity: :medium)
      @lockers[key+2000] = Locker.new(number: key+2000, capacity: :large)
    end
    # ap @lockers
  end

  def luggage_program
    @current_command = 0
    until @current_command == 3
      display_menu
      case @current_command
      when 1
        check_in_prompt
      when 2
        check_out_prompt
      when 3
        puts ""
      else
        puts "Invalid entry. Please try again"
      end
    end
  end

  def user_input_prompt
    print ">> "
    gets.chomp
  end

  def display_menu
    puts "Please select from the following options:"
    puts "1) Check bags"
    puts "2) Claim bags"
    puts "3) Exit Application"
    @current_command = user_input_prompt.to_i
  end

  def check_in_prompt
    puts
    puts "Please enter bag size (small, medium or large):"
    size = user_input_prompt
    check_in_luggage(size)
  end

  def check_luggage_error
    puts
    puts "Please enter small, medium or large"
    check_in_prompt
  end

  def check_in_luggage(size)
    bag_size = size.downcase.to_sym
    selected_lockers = @lockers.select {|locker_number, locker_obj| locker_obj.capacity == bag_size}

    return check_luggage_error if bag_size != :small && bag_size != :medium && bag_size != :large

    selected_lockers.each do |locker_number, locker_obj|
      if locker_obj.available == true
        locker_obj.available = false
        locker_obj.ticket = generate_ticket
        # ap locker_obj
        return print_ticket(locker_obj.ticket)
      end
    end

    if bag_size == :small
      bag_size = :medium
    elsif bag_size == :medium
      bag_size = :large
    elsif bag_size == :large
      return full_locker_error
    end
      check_in_luggage(bag_size)
  end

  def full_locker_error
    puts "All lockers are full"
    luggage_program
  end

  def generate_ticket
    characters = [('a'..'z'), ('1'..'20')].map { |i| i.to_a }.flatten
    ticket_number = Array.new(5) { characters.sample }.join.to_s
  end

  def print_ticket(ticket_number)
    puts  " - " * 15 + "T I C K E T" + " - " * 15
    puts
    puts "Please present this ticket to concierge for luggage retrieval "
    puts "Ticket Number: " + ticket_number
    puts
    puts  " - " * 34
  end

  def check_out_prompt
    puts
    puts "Enter the ticket number"
    ticket = user_input_prompt
    check_out_luggage(ticket)
  end

  def invalid_ticket_error
    puts
    puts "Invalid Ticket Number. Please try again."
    check_out_prompt
  end

  def check_out_luggage(ticket_number)
    @lockers.each do |locker_number, locker_obj|
      if locker_obj.ticket. == ticket_number.downcase
        locker_obj.available = true
        locker_obj.ticket = nil
        puts
        puts "Retrieve bag from locker number #{locker_number}"
        puts
        return
      end
    end
    invalid_ticket_error
  end

end

class Locker
  attr_reader :capacity
  attr_accessor :available, :ticket
  def initialize(args)
    @number = args[:number]
    @capacity = args[:capacity]
    @available = true
    @ticket = nil
  end

end

hotel = Hotel.new
hotel.luggage_program

# Driver code to test locker availability
# 1010.times do |i|
#   puts i
#   hotel.check_in_luggage("small")
# end
# 1010.times do |i|
#   puts i
#   hotel.check_in_luggage("medium")
# end
# 981.times do |i|
#   puts i
#   hotel.check_in_luggage("large")
# end
##