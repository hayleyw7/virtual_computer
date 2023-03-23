class User
  # attr_reader :username

  def initialize(username, users)
    # @@users = {}
    # @users = users
    # username = username
    @users[username] = {}
    @users[username]["files"] = {}


    # if @username && @@users && !@@users.has_key?(@username)
    #   @@users[@username[@files]] = {}
    # end
  end

  def get_files(users, username)
    puts "YOUR FILES:"
    puts
    # puts @users["#{username}"]
    puts @users["#{username}"]["files"]
  end

  def create(file_name, file_content, username, users)

    @users["#{username}"]["files"][file_name] = file_content
    puts
    puts "IS THIS THE FILE NAME FOLDER?"
    puts @users[username]["files"]
    puts "FILE NAME"
    puts file_name
    puts "FILE CONTENT"
    puts file_content
    puts
    puts
    puts
    puts @users["#{username}"]["files"]
    puts
    puts
    puts

  end

  def delete(file_to_delete, username, users)
    puts "delete hit"
    @users["#{username}"]["files"].delete("#{file_to_delete}")
  end
end
