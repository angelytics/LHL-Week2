require 'colorize'
require_relative 'contact'

class ContactList
  
  def start
    case ARGV[0]
    when "new"
      add_new_contact
    when "list"
      list_all
    when "find"
      find_by_id
    when nil
      run
    else
      run
    end
  end
  
  def run
    show_main_menu
    input = STDIN.gets.chomp
    program_response(input)
  end

  def show_main_menu
    puts "Select one of the options below to get started".blue
    puts " new      - Create a new contact".red
    puts " list     - List all contacts".green
    puts " find     - Find contact by id".red
    puts " quit     - Exit Application".green
    print "> ".yellow
  end

  def add_new_name
    print "Please enter the first and last name: ".blue
    name = STDIN.gets.chomp
  end

  def add_new_email
    print "Please enter the email address: ".blue
    email = STDIN.gets.chomp
  end

  def add_new_contact
    new_name = add_new_name
    new_email = add_new_email
    Contact.create(new_name, new_email)
    puts "\n"
    puts "#{new_name} and #{new_email}, have been added.".green
    puts "\n"
    run
  end

  def list_all
     p Contact.all
     run
  end
  
  def find_by_id
    puts "Please enter the id number: ".blue
    print ">> ".yellow
    id = STDIN.gets.chomp.to_i
    puts Contact.find(id)
  end

  def program_response(response)
    option = response.downcase
    case option
    when 'new'
      add_new_contact
    when 'list'
      list_all
    when 'find'
      find_by_id
    when 'quit'
      puts 'Have a nice day!'.green
      exit
    else 
      puts "Sorry, that's not a valid option. Please try again.".red
      puts
      run
    end
  end

end

