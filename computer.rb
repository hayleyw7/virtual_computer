# require_relative './runner.rb'
require_relative './user.rb'

class Computer
  attr_reader :username, :users, :files

  def initialize(username)
    @username = username
    # @password = password
    # @users

    add_user(@username)
  end

  def add_user(username)
    user = User.new(username: username)
  end
end
