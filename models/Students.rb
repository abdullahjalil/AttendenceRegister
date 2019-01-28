class Students

  attr_accessor :StudentID, :FirstName, :LastName

  def self.open_connection
     con = PG.connect(dbname: "attendence_tracker")
  end

  def self.all
    con = self.open_connection

    sql = "SELECT * FROM Students;"

    results = con.exec(sql)

    students = results.map do |student_data|
      self.hydrate student_data
    end

  end

  def self.find studentID
      con = self.open_connection

      sql = "SELECT * FROM register WHERE StudentID=#{studentID}"

      result = con.exec(sql)

      student = self.hydrate result[0]
    end

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
      student = Students.new

      student.StudentID = student_data['StudentID']
      student.FirstName = student_data['FirstName']
      student.LastName = student_data['LastName']
      student
    end

  end
