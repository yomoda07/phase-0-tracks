require 'sqlite3'
require 'faker'
require "date"

# Create database
db = SQLite3::Database.new("Smoker.db")
db.results_as_hash = true;

# Create tables for cigarrets and smokers
create_cigarettes_table = <<-SQL
  create table if not exists cigarettes(
    id integer primary key,
    name varchar(255),
    price int,
  );
SQL

create_smokers_table = <<-SQL
  create table if not exists smokers(
    id integer primary key,
    name varchar(255),
    cigarette_id int,
    daily_cig_cons int,
    total_cug_cons int,
    updated_at varchar(255),
    foreign key(cigarette_id) references cigarettes(id)
  );
SQL

db.execute(create_cigarettes_table)
db.execute(create_smokers_table)


# Populate each table
def add_cigarette(db, name, price)
  db.execute("INSERT INTO kittens (name, price) VALUES (?, ?)", [name, price])
end

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

def add_smoker(db, user)
  db.execute("INSERT INTO kittens (
      name, cigarette_id, daily_cig_cons, total_cug_cons) VALUES (?, ?, ?, ?)",
      [
        user['name'],
        user['cigarette_id'],
        user['daily_cig_cons',
        user['total_cug_cons'],
        user['updated_at']
      ])
end

5000.times do
  user['name'] = Faker::Name.name
  user['cigarette_id'] = rand(1..10)
  user['daily_cig_cons'] = rand(1..20)
  user['total_cug_cons'] = rand(1..500)
  user['updated_at'] = Date.today

  add_smoker(db, user)
end
