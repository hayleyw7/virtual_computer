require_relative './user.rb'

class Computer
  # attr_reader :username, :@users, :files

  def initialize(username, users)
    # username = username
    # @@users = {}
    # @password = password

    add_user(username, @users)
  end

  def add_user(username, users)
    user = User.new(username, @users)
  end
end
