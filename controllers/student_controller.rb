
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

    # @students = Student.all
    @groups = Group.all
    erb :"register/index"
  end

  #new
  get "/new" do
    @Student = Student.new
    erb :"register/student_add"
  end

  # Uses faker to generate names
  get "/students/generate_names" do
    id = params[:id].to_i
    @students = Student.all
    @students.each do |student|
      student.firstname = Faker::Name.first_name.gsub(/\W/, ' ')
      student.lastname = Faker::Name.last_name.gsub(/\W/, ' ')
      student.save
    end
    redirect "/"
  end

  # Show students in group
  get "/:id" do
    id = params[:id].to_i

    @students = Student.group id
    # @attendence = Attendence.find id

    erb :"register/show"
  end

  # Show students in group
  get "/students/:studentid" do
    studentid = params[:studentid].to_i

    @students = Student.find studentid
    # @attendence = Attendence.find id

    erb :"register/showstudent"
  end

  #edit
  get "/students/:studentid/edit" do
    studentid = params[:studentid].to_i
    @Student = Student.find studentid
    erb :"register/student_edit"
  end

  # Create attendence
  post "/:id" do
    id = params[:id].to_i
    attendence = Attendence.new

    attendence.date = params[:date]
    attendence.status = params[:status].gsub(/\W/, ' ')
    attendence.studentid = params[:studentid]
    attendence.comments = params[:comments].gsub(/\W/, ' ')


    attendence.save

    redirect "/#{id}"
  end

  # Create
  post "/" do
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

  # Delete
  delete "/attendence/:id" do
    id = params[:id].to_i
    studentid = params[:studentid].to_i

    Attendence.destroy id

    redirect "/#{studentid}"
  end

end
