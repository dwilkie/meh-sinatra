require 'sinatra'

# set test environment
set :environment, :test
require File.join(File.dirname(__FILE__), '..', 'meh')

require 'rack/test'
require 'rspec'
require 'rspec/autorun'

Rspec.configure do |c|
  c.color_enabled = true
end
