require_relative './computer.rb'
require_relative './user.rb'

class Runner
  def self.start
    puts
    puts "Username:"
    @username_entry = gets.chomp

    puts
    puts "Password:"
    @password_entry = gets.chomp

    instantiate_computer
    instantiate_user
    user_choice_prompt
  end

  def self.instantiate_computer
    @computer ||= Computer.new(@username_entry, @password_entry)
  end

  def self.instantiate_user
    puts @user
    @user ||= User.new(username: @username_entry, password: @password_entry)
  end

  def self.user_choice_prompt
    puts
    puts "-----------------------------"
    puts "WHAT WOULD YOU LIKE TO DO?"
    puts "- 'CREATE' - create a file"
    # puts "- 'DELETE' - delete a file"
    puts "- 'FILES' - list all files"
    puts "- 'USERS' - list all users"
    puts "- 'LOGOUT' - logout"
    puts "-----------------------------"
    puts

    user_choice_logic
  end

  def self.user_choice_logic
    choice = gets.chomp.downcase
    instantiate_user
    instantiate_computer
    puts

    case choice
    when "create"
      puts "File name:"
      file_name = gets.chomp
      puts
      puts "File contents:"
      file_content = gets.chomp

      @user.create(file_name, file_content)
  
      puts
      puts "FILE SUCCESSFULLY CREATED!"

    when "files"
      @user.get_files

    # when "delete"
    #   puts "File name:"
    #   file_to_delete = gets.chomp.to_sym

    #   puts
    #   puts "Are you sure? Y or N"
    #   delete_confirmation = gets.chomp.downcase
    #   puts

    #   if delete_confirmation == "y"
    #     @user.delete(file_to_delete)
    #     puts "FILE SUCCESSFULLY DELETED!"
    #   end

    when "users"
      puts @user.get_users

    when "logout"
      start

    else
      puts "ERROR: INVALID OPTION"
    end

    user_choice_prompt
  end

  start
end
