class SandwichesController < Sinatra::Base

  # Enable Reloader
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

    unless cookies[:visited]
      @message = true

      # cookies[:visited] = 1
      response.set_cookie(:visited, :value => 1, :expires => Time.now + 10)

    end

    @sandwiches = Sandwich.all
    erb :"sandwiches/index"
  end

  # New
  get "/new" do
    @sandwich = Sandwich.new
    erb :"sandwiches/new"
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

  # Edit
  get "/:id/edit" do
    id = params[:id].to_i
    @sandwich = Sandwich.find id

    erb :"sandwiches/edit"
  end

  # Create
  post "/" do
    sandwich = Sandwich.new

    sandwich.title = params[:title]
    sandwich.description = params[:description]

    sandwich.save

    redirect "/"
  end

  put "/:id" do
    id = params[:id].to_i

    sandwich = Sandwich.find id

    sandwich.title = params[:title]
    sandwich.description = params[:description]

    sandwich.save

    redirect "/#{id}"
  end

  delete "/:id" do
    id = params[:id].to_i

    Sandwich.destroy id

    redirect "/"
  end

end
