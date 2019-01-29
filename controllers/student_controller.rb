
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

    @students = Student.all
    erb :"register/index"
  end

  #new
  get "/new" do
    @Student = Student.new
    erb :"register/student_add"
  end
  # Show
  get "/:id" do
    id = params[:id].to_i

    @students = Student.find id
    # @attendence = Attendence.find id

    if(!session[:students])
      session[:students] = []
    end

    if !session[:students].include? @students.studentid
      session[:students].push @students.studentid
    end

    print session[:students]
    erb :"register/show"
  end

  #edit
  get "/:id/edit" do
    id = params[:id].to_i
    @Student = Student.find id
    erb :"register/student_edit"
  end

  # Create
  post "/" do
    student = Student.new

    student.firstname = params[:firstname]
    student.lastname = params[:lastname]

    student.save

    redirect "/"
  end

  # Update
  put "/:id" do
    id = params[:id].to_i

    student = Student.find id

    student.firstname = params[:firstname]
    student.lastname = params[:lastname]

    student.save

    redirect "/#{id}"
  end

  # Delete
  delete "/:id" do
    id = params[:id].to_i

    Student.destroy id

    redirect "/"
  end

end
