require 'rubygems'
require 'bundler/setup'

require "pry"
require "active_record"
require "sinatra"
require "sinatra/json"
require "sqlite3"
require 'bcrypt'

set :sessions, true

#setting up database
configure :development do
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'database.db')
end

# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)




# Models
require_relative "models/task.rb"

# Controllers
require_relative "controllers/main.rb"


#### list of photos ####

# img
# http://c1.staticflickr.com/1/312/19106288753_d707ee5343_h.jpg

# description
# 6 frame vertical panorama shot at Bodie Island Lighthouse in the Outer Banks.

# album
# North Carolina
# panorama
# long exposure
