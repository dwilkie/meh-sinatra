require 'dm-core'
configure :test do
  DataMapper.setup(:default, 'sqlite3::memory:')
end

