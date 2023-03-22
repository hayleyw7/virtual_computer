# require_relative './runner.rb'
require_relative './user.rb'
# require_relative 'files.rb'

class Computer
  attr_reader :username, :password, :users

  def initialize(username=nil, password=nil)
    @username = username
    @password = password
    @users

    # if @username && @users
    #   if @users.has_key?(@username)
    #     puts "User already exists."
    #   else
    #     puts @users
    #     @users[@username] = @password
    #   end
    # end

    add_user(username, password)
  end

  def add_user(username, password)
    username = User.new(username: username, password: password)
  end
  
  # def get_users
  #   @users
  # end
end
