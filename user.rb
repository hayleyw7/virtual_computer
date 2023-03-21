class User
  attr_reader :username, :password, :files

  def initialize(username=nil, password=nil)
    @username = username
    @password = password
    @files = {}
    # @users = {}
    # @users[username] = password
  end

  def get_files
    puts files
  end

  def create(file_name, file_content)
    files[file_name] = file_content
  end

  def delete(file_to_delete)
    files.delete(file_to_delete)
  end
end
