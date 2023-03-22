require_relative './computer.rb'
require_relative './user.rb'
# require_relative './files.rb'

class Runner
  def self.start
    puts
    puts "Username:"
    @username_entry = gets.chomp

    puts
    puts "Password:"
    @password_entry = gets.chomp

    instantiate_computer
    # instantiate_user()
    user_choice_prompt
  end

  def self.instantiate_computer
    @computer ||= Computer.new(@username_entry, @password_entry)
  end

  def self.instantiate_user
    @user ||= User.new(username: @username_entry, password: @password_entry)
    # @user ||= User.new()
  end

  # def self.instantiate_files
  #   @files ||= Files.new(user_choice)
  # end

  def self.user_choice_prompt
    puts
    puts "----------------------------------"
    puts "WHAT WOULD YOU LIKE TO DO?"
    puts "-- Type 'create' to create a file."
    puts "-- Type 'files' to view all files."
    puts "-- Type 'users' to view all users."
    puts "-- Type 'delete' to delete a file."
    puts "-- Type 'end' to log out."
    puts "----------------------------------"
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

      # instantiate_computer
      # instantiate_files

      @user.create(file_name, file_content)
  
      puts
      puts "FILE SUCCESSFULLY CREATED!"
      # puts
      # puts "File: #{file_name}"
      # puts "Author: #{@username_entry}"
      # puts "Contents: #{file_content}"
      # puts

    when "files"
      # instantiate_files
      @user.get_files

    when "delete"
      puts "File name:"
      file_to_delete = gets.chomp.to_sym

      puts
      puts "Are you sure? Y or N"
      delete_confirmation = gets.chomp.downcase
      puts

      if delete_confirmation == "y"
        @user.delete(file_to_delete)
        puts "FILE SUCCESSFULLY DELETED!"
      end

    when "users"
      # instantiate_computer
      puts @user.get_users

    when "end"
      start

    else
      puts "ERROR: INVALID OPTION"
    end

    user_choice_prompt
  end

  start
end
