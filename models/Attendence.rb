class Attendence

  attr_accessor :date, :status, :studentid, :comments

  def self.open_connection
     con = PG.connect(dbname: "attendence_tracker")
  end

  def self.all
    con = self.open_connection

    sql = "SELECT * FROM attendence"

    results = con.exec(sql)

    students = results.map do |student_data|
      self.hydrate student_data
    end

  end

  # def self.find studentID
  #   con = self.open_connection
  #
  #   sql = "SELECT * FROM attendence WHERE studentid=#{studentID}"
  #
  #   result = con.exec(sql)
  #
  #   student = self.hydrate result[0]
  # end

    # save + update data entry
    # def self.save
    #   con = Students.open_connection
    #
    #   if (self.StudentID)
    #     # update
    #     sql = "UPDATE students SET title='#{self.title}', description='#{self.description}' WHERE id = #{self.id}"
    #   else
    #     # add
    #     sql = "INSERT INTO students (title, description) VALUES ('#{self.title}','#{self.description}')"
    #   end
    #
    #
    #   con.exec(sql)
    #
    # end

    # delete data entry
    # def self.destroy id
    #   con = self.open_connection
    #
    #   sql = "DELETE FROM students WHERE id = #{id}"
    #
    #   con.exec(sql)
    # end

    def self.hydrate student_data
      studentAttend = Attendence.new

      studentAttend.date = student_data['date']
      studentAttend.status = student_data['status']
      studentAttend.studentid = student_data['studentid']
      studentAttend.comments = student_data['comments']
      studentAttend
    end

  end
