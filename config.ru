require "sinatra"
require "sinatra/reloader"
require "pg"
require_relative "models/Attendence.rb"
require_relative "models/Students.rb"
require_relative "controllers/attendence_controller.rb"
require_relative "controllers/student_controller.rb"

use Rack::MethodOverride

use AttendenceController

run StudentController
