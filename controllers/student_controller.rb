
class StudentController < Sinatra::Base

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

  #new
  get "/students/new" do
    @Student = Student.new
    erb :"Students/student_add"
  end

  # Uses faker to generate names
  get "/students/generate_names" do
    @students = Student.all
    @students.each do |student|
      student.firstname = Faker::Name.first_name.gsub(/\W/, ' ')
      student.lastname = Faker::Name.last_name.gsub(/\W/, ' ')
      student.save
    end
    groupid = params[:groupid].to_i

    redirect "/#{groupid}"
  end

  # Show students in group
  get "/:id" do
    id = params[:id].to_i
    @groups = Group.find id
    @students = Student.group id
    @groups = Group.find id
    # @attendence = Attendence.find id


    erb :"Groups/show"
  end

  # Show students in group
  get "/students/:studentid" do
    studentid = params[:studentid].to_i

    @students = Student.find studentid
    # @attendence = Attendence.find id

    erb :"Students/showstudent"
  end

  #edit
  get "/students/:studentid/edit" do
    studentid = params[:studentid].to_i
    @Student = Student.find studentid
    erb :"Students/student_edit"
  end

  # Create attendence
  post "/:id" do
    id = params[:id].to_i
    attendence = Attendence.new

    attendence.date = params[:date]
    attendence.status = params[:status]
    attendence.studentid = params[:studentid]
    attendence.comments = params[:comments].gsub(/\W/, ' ')


    attendence.save

    redirect "/students/#{id}"
  end

  # Create
  post "/students/" do
    student = Student.new

    student.firstname = params[:firstname].gsub(/\W/, ' ')
    student.lastname = params[:lastname].gsub(/\W/, ' ')
    student.groupid = params[:groupid]
    student.save

    redirect "/"
  end

  # Update
  put "/students/:studentid" do
    studentid = params[:studentid].to_i

    student = Student.find studentid

    student.firstname = params[:firstname].gsub(/\W/, ' ')
    student.lastname = params[:lastname].gsub(/\W/, ' ')
    student.groupid = params[:groupid]

    student.save

    redirect "/students/#{studentid}"
  end

  # Delete
  delete "/:id" do
    id = params[:id].to_i

    Student.destroy id

    redirect "/"
  end

  # Search
  get "/search/result" do
    parameter = params[:searchquery]
    @searchresults = Search.search parameter
    erb :"search/search_results"
  end

end
