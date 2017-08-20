require 'sqlite3'
require 'faker'
require "date"

# Create database
db = SQLite3::Database.new("smoker.db")
db.results_as_hash = true;

# Create tables for cigarrets and users
create_cigarettes_table = <<-SQL
  create table if not exists cigarettes(
    id integer primary key,
    name varchar(255),
    price int
  )
SQL

create_users_table = <<-SQL
  create table if not exists users(
    id integer primary key,
    name varchar(255),
    cigarette_id int,
    ave_cig_cons int,
    updated_at varchar(255),
    created_at varchar(255),
    foreign key(cigarette_id) references cigarettes(id)
  )
SQL

create_smoking_logs_table = <<-SQL
  create table if not exists smoking_logs(
    id integer primary key,
    user_id int,
    smoking_record int,
    recorded_at int,
    foreign key(user_id) references users(id)
  )
SQL

db.execute(create_cigarettes_table)
db.execute(create_users_table)
db.execute(create_smoking_logs_table)


# Populate each table
def add_cigarette(db, name, price)
  db.execute("insert into cigarettes(name, price) values (?, ?)", [name, price])
end

def add_user(db, new_user)
  db.execute("insert into
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
end

# def add_logs(db, record, smoker)
#   db.execute("insert into cigarettes(name, price) values (?, ?)", [name, price])
# end


cigarettes = {
  "Marlboro" => 10.2,
  "Camel" => 9.3,
  "Lucky Strike" => 11.7,
  "Newport" => 10.0,
  "Pall Mall" => 8.4,
  "Dunhill" => 11.4,
  "Winston" => 9.0,
  "L&M" => 8.3,
  "Kool" => 8.3,
  "Benson & Hedges" => 11.4
}
cigarettes.each do |name, price|
  add_cigarette(db, name, price)
end

5000.times do
  user = {}
  user['name'] = Faker::Name.name
  user['cigarette_id'] = rand(1..10)
  user['ave_cig_cons'] = rand(1..30)
  user['updated_at'] = Date.today.to_s
  user['created_at'] = Date.today.to_s

  add_user(db, user)
end
