# meh.rb
require 'sinatra'
require 'dm-core'
#require 'active_record'
# remove this in production and put into config.ru file
require File.join(File.dirname(__FILE__), 'config', 'environment')

require File.join(File.dirname(__FILE__), 'models', 'supplier')

get '/' do
  'Meh'
end
