require 'dm-core'

configure :test do
  # An in-memory Sqlite3 connection:
  DataMapper.setup(:default, 'sqlite3::memory:')
end

