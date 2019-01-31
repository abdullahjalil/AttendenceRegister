class GroupController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # Sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Index
  get "/" do

    @groups = Group.all
    erb :"Groups/index"
  end

  # Show students in group
  get "/:id" do
    id = params[:id].to_i

    @students = Student.group id
    @groups = Group.find id
    # @attendence = Attendence.find id


    erb :"Groups/show"
  end

  # Create Group
  post "/" do
    group = Group.new

    group.groupid = params[:groupid]
    group.groupname = params[:groupname].gsub(/\W/, ' ')
    group.grouptype = params[:grouptype]

    group.save

    redirect "/"
  end

end