# meh.rb
require 'sinatra'
# remove this in production and put into config.ru file
require File.join(File.dirname(__FILE__), 'config', 'environment')

get '/' do
  'Meh'
end
