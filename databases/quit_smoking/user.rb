require "sqlite3"

class User
  attr_reader :id
  def initialize
    @db = SQLite3::Database.new("smoker.db")
    @db.results_as_hash = true;
  end

  def sign_up(user)
    new_user = @db.execute("insert into
        smokers(
          name,
          cigarette_id,
          daily_cig_cons,
          total_cig_cons,
          updated_at
          )
        values (?, ?, ?, ?, ?)",
        [
          user['name'],
          user['cigarette_id'],
          user['daily_cig_cons'],
          user['total_cig_cons'],
          user['updated_at']
        ])
    @id = new_user['id']
  end

  def sign_in(id)
    @db.execute("select * from smokers where id=?", [id])
    @id = id
  end

  def update_total(num_of_cig)
    total = @db.execute("select total_cig_cons from smokers where id=?",[@id])[0]["total_cig_cons"]
    total += num_of_cig
    @db.execute("update smokers set total_cig_cons=? where id=?", [ total, @id])
  end

  def delete
    @db.execute("delete from smokers where id=?", [@id])
  end
end
