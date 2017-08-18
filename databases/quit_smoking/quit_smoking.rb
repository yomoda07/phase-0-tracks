require "sqlite3"
require_relative 'user'
require_relative 'cigarette'

class QuitSmoking

  def initialize
    @db = SQLite3::Database.new("smoker.db")
    @db.results_as_hash = true;
  end

  def start()

    end
  end
end
