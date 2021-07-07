require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  ActiveRecord::Base.connection
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
