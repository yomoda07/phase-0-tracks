require "sqlite3"
class Cigarette
  def initialize
    @db = SQLite3::Database.new("smoker.db")
    @db.results_as_hash = true
  end

  def show_all_cigarettes
    cigarettes = @db.execute("select id, name from cigarettes;")
  end

  def add_cigarette(cig, price)
    @db.execute("insert into cigarettes(name, price) values (?, ?)",[cig, price])
    @db.execute("select max(id) from cigarettes")[0]['max(id)']
  end

  def get_cigarette_price(cigarette_id)
    @db.execute("select price from cigarettes where id=?", [cigarette_id])[0]['price']
  end
end
