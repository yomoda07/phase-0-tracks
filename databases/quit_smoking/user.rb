require 'sqlite3'
require 'date'

class User
  attr_reader :id, :name, :ave_cig_cons, :cigarette_id
  def initialize
    @db = SQLite3::Database.new("smoker.db")
    @db.results_as_hash = true
  end

  def sign_up(new_user)
    @db.execute("insert into
          users(
            name,
            cigarette_id,
            ave_cig_cons,
            updated_at,
            created_at
            )
          values (?, ?, ?, ?, ?)",
          [
            new_user['name'],
            new_user['cigarette_id'],
            new_user['ave_cig_cons'],
            new_user['updated_at'],
            new_user['created_at']
          ])
      @id = @db.execute("select max(id) from users")[0]['max(id)']
      get_user_info
  end

  def sign_in(id, name)
    user = @db.execute("select * from users where id=?", [id])
    if user[0]['name'] == name
      @id = id
      get_user_info
      return true
    end
    false
  end

  def delete
    @db.execute("delete from users where id=?", [@id])
  end

  def get_user_info
    user = @db.execute("select * from users where id=?",[@id])
    @name = user[0]['name'].split(' ')[0]
    @ave_cig_cons = user[0]['ave_cig_cons']
    @cigarette_id = user[0]['cigarette_id']
  end
end
