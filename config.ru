require "sinatra"
require "sinatra/reloader"
require "sinatra/cookies"
require "pg"
require_relative "models/sandwich"
require_relative "controllers/sandwiches_controller"

use Rack::MethodOverride

run SandwichesController
