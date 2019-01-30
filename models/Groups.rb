class Group

  attr_accessor :groupid, :groupname

  def self.open_connection
     con = PG.connect(dbname: "attendence_tracker")
  end

  def self.all
    con = self.open_connection
    sql = "SELECT * FROM groups"

    results = con.exec(sql)

    groups = results.map do |group_data|
      self.hydrate group_data
    end
  end

  def self.find groupID
    con = self.open_connection

    sql = "SELECT * FROM groups WHERE groupid=#{groupID}"

    result = con.exec(sql)

    group = self.hydrate result[0]
  end

  # save + update data entry
  def save
    con = Group.open_connection

    if (self.groupid)
      # update
      sql = "UPDATE groups SET groupname='#{self.groupname}' WHERE groupid = #{self.groupid}"
    else
      # add
      sql = "INSERT INTO groups (groupname) VALUES ('#{self.groupname}')"
    end
    #
    #
    con.exec(sql)
    #
  end

  # delete data entry
  # def self.destroy id
  #   con = self.open_connection
  #
  #   sql1 = "DELETE FROM attendence WHERE studentid = #{id}"
  #
  #   con.exec(sql1)
  #
  #   sql = "DELETE FROM students WHERE studentid = #{id}"
  #
  #   con.exec(sql)
  # end

  def self.hydrate group_data
    group = Group.new

    group.groupid = group_data['groupid']
    group.groupname = group_data['groupname']
    group
  end

end
