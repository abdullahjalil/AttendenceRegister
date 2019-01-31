class SearchController < Sinatra::Base

  # Sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # Sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get "/search/result" do
    parameter = params[:searchquery]

    @searchresults = Search.search parameter
    erb :"search/search_results"
  end
end
