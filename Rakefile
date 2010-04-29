require 'rake'
require 'active_record'
require 'yaml'


namespace :db do

  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end

  task :load_config do
    DBconfig = YAML::load( File.open('db/config.yml') )
  end

  namespace :create do
    desc 'Create all the local databases defined in config/database.yml'
    task :all => :load_config do

    end

  def create_database(config)
    begin
      if File.exist?(config['database'])
        $stderr.puts "#{config['database']} already exists"
      else
        begin
          # Create the SQLite database
          ActiveRecord::Base.establish_connection(config)
          ActiveRecord::Base.connection
        rescue
          $stderr.puts $!, *($!.backtrace)
          $stderr.puts "Couldn't create database for #{config.inspect}"
        end
      end
      return # Skip the else clause of begin/rescue
    rescue
      $stderr.puts "#{config['database']} already exists"
    end
  end
end
