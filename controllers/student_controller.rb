
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
    erb :"register/index"
  end

  #new
  get "/new" do
    @Student = Student.new
    erb :"register/student_add"
  end

  get "/generate_names" do
    @students = Student.all
    @students.each do |student|
      student.firstname = Faker::Name.first_name.gsub(/\W/, ' ')
      student.lastname = Faker::Name.last_name.gsub(/\W/, ' ')
      student.save
    end
    redirect "/"
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
    student.save

    redirect "/"
  end

  # Update
  put "/:id" do
    id = params[:id].to_i

    student = Student.find id

    student.firstname = params[:firstname].gsub(/\W/, ' ')
    student.lastname = params[:lastname].gsub(/\W/, ' ')

    student.save

    redirect "/#{id}"
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
