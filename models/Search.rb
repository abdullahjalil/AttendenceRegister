class Search
  attr_accessor :studentid, :firstname, :lastname, :groupid

  def self.open_connection
     con = PG.connect(dbname: "attendence_tracker")
  end
  #
  def self.search parameter

    # if params[:searchquery].blank?
    #   redirect_to(root_path, alert: "Empty field!") and return
    # else
      con = self.open_connection

      sql = "SELECT * FROM students WHERE firstname LIKE '#{parameter}%' OR lastname LIKE '#{parameter}%'"

      results = con.exec(sql)

      students = results.map do |student_data|
        self.hydrate student_data
      end
    # end
  end

  def self.hydrate student_data
    search = Search.new

    search.studentid = student_data['studentid']
    search.firstname = student_data['firstname']
    search.lastname = student_data['lastname']
    search.groupid = student_data['groupid']

    search
  end
end
