# require_relative './runner.rb'
require_relative './user.rb'

class Computer
  attr_reader :username, :password, :users

  def initialize(username=nil, password=nil)
    @username = username
    @password = password
    @users

    add_user(username, password)
  end

  def add_user(username, password)
    username = User.new(username: username, password: password)
  end
end
