class SearchController < Sinatra::Base
  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      get '/:id' do
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
    end
  end
end
