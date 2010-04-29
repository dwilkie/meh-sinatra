require 'sinatra'
# set test environment
set :environment, :test
app_file = File.join(File.dirname(__FILE__), *%w[.. .. meh.rb])
require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file
require 'rspec/expectations'
require 'rack/test'

class MyWorld
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}
