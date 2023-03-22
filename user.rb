class User
  attr_reader :username, :password, :files

  def initialize(username=nil, password=nil)
    @username = username
    @password = password
    @files = {}
    @users = {}

    # if @username && @users && !@users.has_key?(@username)
    if @users && !@users.has_key?(@username)
      @users[username] = password
    end

    # @users[username] = password
  end

  def get_files
    puts "YOUR FILES:"
    puts
    puts files
  end

  def create(file_name, file_content)
    files[file_name] = file_content
  end

  def delete(file_to_delete)
    files.delete("#{file_to_delete}")
  end

  def get_users
    # @users
    @users
  end
end
