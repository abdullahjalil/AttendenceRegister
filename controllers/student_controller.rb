# <<<<<<< HEAD
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

    @students = Students.all
    erb :"register/index"
  end

  # Show
  get "/:id" do
    id = params[:id].to_i

    @students = Student.find id

    if(!session[:students])
      session[:students] = []
    end

    if !session[:students].include? @student.title
      session[:students].push @student.title
    end

    print session[:students]


    erb :"students/show"
  end

end
# =======
# zac harrison
# >>>>>>> master
