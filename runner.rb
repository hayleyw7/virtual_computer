require_relative './computer.rb'
require_relative './user.rb'

class Runner
  # def initialize
  #   @@users = {}
  # end

  def self.start
    @@users = {}

    puts
    puts "Username:"
    username = gets.chomp
    puts

    # puts
    # puts "Password:"
    # @password_entry = gets.chomp

    instantiate_computer(username, @@users)
    instantiate_user(username, @@users)
    user_choice_prompt(username, @@users)
  end

  def self.instantiate_computer(username, users)
    @computer ||= Computer.new(username, @users)
  end

  def self.instantiate_user(username, users)
    # puts @user
    # @user ||= User.new(username: username)
    # if @@users.key?("${username}"]
    # puts "USER LIST HERE"
    # puts @users
    # if @@users.key?(username)
    #   # nothing
    # else
    @active_user = User.new(username, users)
      # active_user = @users[username]
    # puts @active_user
    # end
  end

  def self.user_choice_prompt(username, users)
    puts
    puts "-----------------------------"
    puts "WHAT WOULD YOU LIKE TO DO?"
    puts "- 'CREATE' - create a file"
    puts "- 'DELETE' - delete a file"
    puts "- 'FILES' - list all files"
    puts "- '@users' - list all @users"
    puts "- 'LOGOUT' - logout"
    puts "-----------------------------"
    puts

    choice = gets.chomp.downcase

    user_choice_logic(username, @users, choice)
  end

  def self.user_choice_logic(username, users, choice)
    instantiate_user(username, @users)
    instantiate_computer(username, @users)
    puts

    case choice
    when "create"
      puts "File name:"
      file_name = gets.chomp
      puts
      puts "File contents:"
      file_content = gets.chomp

      # instantiate_user(username, @users)

      # puts @active_user
      @active_user.create(file_name, file_content, username, @users)
  
      puts
      puts "FILE SUCCESSFULLY CREATED!"

    when "files"
      @active_user.get_files(@users, username)

    when "delete"
      puts "File name:"
      file_to_delete = gets.chomp.to_sym

      puts
      puts "Are you sure? Y or N"
      delete_confirmation = gets.chomp.downcase
      puts

      if delete_confirmation == "y"
        @active_user.delete(file_to_delete, username, @users)
        puts "FILE SUCCESSFULLY DELETED!"
      end

    when "@users"
      puts @users

    when "logout"
      start

    else
      puts "ERROR: INVALID OPTION"
    end

    user_choice_prompt(username, @users)
  end

  start
end
