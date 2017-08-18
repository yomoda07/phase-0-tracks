require "sqlite3"
class Cigarette
  def initialize
    @db = SQLite3::Database.new("smoker.db")
    @db.results_as_hash = true;
  end
end
