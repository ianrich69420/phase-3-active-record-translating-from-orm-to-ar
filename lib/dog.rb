require_relative '../config/environment'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/dogs.sqlite"
)

# Create a Dogs table
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS dogs (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT
  )
SQL
ActiveRecord::Base.connection.execute(sql)

# Log SQL output to the terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Have the dog class inherit from ActiveRecord::Base
class Dog < ActiveRecord::Base
end

binding.pry
""
