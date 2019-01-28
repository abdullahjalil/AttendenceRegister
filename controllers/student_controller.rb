
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

  # Show
  get "/:id" do
    id = params[:id].to_i

    @students = Student.find id

    if(!session[:students])
      session[:students] = []
    end

    if !session[:students].include? @students.studentid
      session[:students].push @students.studentid
    end

    print session[:students]

<<<<<<< HEAD
=======

>>>>>>> ddff610dd68bc82b48c97828b31d2a7a27420267
    erb :"register/show"
  end

end
