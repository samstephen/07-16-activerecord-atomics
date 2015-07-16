require "pry"
require "active_record"
require "sqlite3"

#setting up server
require "sinatra"
require "sinatra/json"

#setting up database
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'database.db')

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)


# Models
require_relative "models/task.rb"

# Controllers
require_relative "controllers/main.rb"

