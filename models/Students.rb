class Students

  attr_accessor :StudentID, :FirstName, :LastName

  def self.open_connection
    connection = PG.connect(dbname: "register")
  end

  def self.all
    connection = self.open_connection

    sql = "SELECT * FROM register ORDER BY StudentID"

    results = connection.exec(sql)

    students = results.map do |student_data|
      self.hydrate student_data
    end

  end

  def self.find studentID
      con = self.open_connection

      sql = "SELECT * FROM register WHERE StudentID=#{studentID}"

      result = con.exec(sql)

      sandwich = self.hydrate result[0]
    end

    # save + update data entry
    def save
      con = Sandwich.open_connection

      if (self.id)
        # update
        sql = "UPDATE sandwich SET title='#{self.title}', description='#{self.description}' WHERE id = #{self.id}"
      else
        # add
        sql = "INSERT INTO sandwich (title, description) VALUES ('#{self.title}','#{self.description}')"
      end


      con.exec(sql)

    end

    # delete data entry
    def self.destroy id
      con = self.open_connection

      sql = "DELETE FROM sandwich WHERE id = #{id}"

      con.exec(sql)
    end

    def self.hydrate sandwich_data
      sandwich = Sandwich.new

      sandwich.id = sandwich_data['id']
      sandwich.title = sandwich_data['title']
      sandwich.description = sandwich_data['description']
      sandwich
    end

  end
