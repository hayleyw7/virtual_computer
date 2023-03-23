class User
  attr_reader :username

  def initialize(username)

    # @username = username
    # @password = password
    @users = {}
    @users[@username] = {}
    @users[@username]["files"] = {}

    # puts "username in user class"
    # puts @users
    # puts @users[@username]
    
    # @users[@username["files"]] = {}

    # @users[@username[@files]] = {}

    # puts @users

    # users = {
    #   "username" => {
    #     "files" => {}
    #   }
    # }

    # if @username && @users && !@users.has_key?(@username)
    # if @users && !@users.has_key?(@username)
    #   @users[@username[@files]] = {}
    # end

    # @users[username] = password
  end

  def get_files
    puts "YOUR FILES:"
    puts
    puts @users[@username]["files"]
  end

  def create(file_name, file_content)
    @users[@username]["files"][file_name] = file_content
  end

  def delete(file_to_delete)
    puts "delete hit"
    @users[@username]["files"].delete("#{file_to_delete}")
  end

  def get_users
    @users
  end
end
