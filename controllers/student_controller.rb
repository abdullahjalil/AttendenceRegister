class StudentController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  helpers Sinatra::Cookies

  set :sessions, true

  # Sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # Index
  get "/" do

    @students = Students.all
    erb :"sandwiches/index"
  end

  # Show
  get "/:id" do
    id = params[:id].to_i

    @sandwich = Sandwich.find id

    if(!session[:sandwiches])
      session[:sandwiches] = []
    end

    if !session[:sandwiches].include? @sandwich.title
      session[:sandwiches].push @sandwich.title
    end

    print session[:sandwiches]


    erb :"sandwiches/show"
  end
