require "sinatra"
require "sinatra/reloader"
require_relative "models/Attendence.rb"
require_relative "models/Student.rb"
require_relative "controllers/attendence_controller.rb"
require_relative "controllers/student_controller.rb"

use attendence_controller
run student_controller
