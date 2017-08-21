require "sqlite3"
require 'date'
require_relative 'user'
require_relative 'cigarette'

class QuitSmoking
  attr_reader :user, :cigarette
  attr_accessor :logged_in
  def initialize
    @logged_in = false
    @db = SQLite3::Database.new("smoker.db")
    @db.results_as_hash = true
    @user = User.new
    @cigarette = Cigarette.new
    @days = 0
  end

  def record(num_of_cig)
      today = Date.today.to_s
      if first_record_today?
        log = @db.execute("insert into smoking_logs(user_id, smoking_record, recorded_at) values(?, ?, ?)", [@user.id, num_of_cig, today])
        current_num = num_of_cig
      else
        current_num = @db.execute("select smoking_record from smoking_logs where user_id=? and recorded_at=?",[@user.id, today])[0]['smoking_record']
         current_num += num_of_cig
         @db.execute("update smoking_logs set smoking_record=? where user_id=? and recorded_at=?",[current_num, @user.id, today])
      end
  end

  def get_total_today
    logs = @db.execute("select smoking_record from smoking_logs where user_id=? and recorded_at=?",[@user.id, Date.today.to_s])[0]['smoking_record']
    logs.each do |log|
      puts "#{log['recorded_at']} : #{log['smoking_record']}"
    end
  end

  def get_logs
     @db.execute("select smoking_record, recorded_at from smoking_logs where user_id=?",[@user.id])
  end

  def get_total
    logs = get_logs
    total = 0
    @days = 0
    logs.each do |log|
      total += log['smoking_record']
      @days += 1
    end
    total
  end

  def get_average
    total = get_total
    total != 0 ? (total / @days).round : "You haven't kept record yet"
  end

  def calc_total_payments
    cigarette_cost = (@cigarette.get_cigarette_price(@user.cigarette_id) / 20)
    total = get_total
    total * cigarette_cost
  end

  def first_record_today?
    today = Date.today
    last_record_id = @db.execute("select max(id) from smoking_logs where user_id=?", [@user.id])[0]['max(id)']
    last_record = @db.execute("select recorded_at from smoking_logs where id=?", [last_record_id])
     if last_record.empty?
      return true
    else
      last_record = last_record[0]['recorded_at'].split('-').map {|el| el.to_i}
      last_record = Date.new(last_record[0], last_record[1], last_record[2])
       (last_record - today).to_i != 0 ? true : false
    end
  end
end

quit_smoking = QuitSmoking.new
puts "Welcmoe to Smoking-log! Let's decrease the number of cigarrets you smoke by recording smoking!"
  loop do
    if !quit_smoking.logged_in
      puts "Please select number"
      puts "1: Sign up"
      puts "2: Sign in"
      num = gets.chomp.to_i
      if !num == 0
        puts "Plese select 1 or 2"
        next
      end
      case num.to_i
      when 1
        user = {}
        puts "Please enter your name"
        user['name'] = gets.chomp
        quit_smoking.cigarette.show_all_cigarettes.each do |cigarette|
          puts "#{cigarette['id']}: #{cigarette['name']}"
        end
        puts "Please select sigarette number you smoke, or type 0 to add new cigarette"
        cigarette = gets.chomp.to_i
        if cigarette == 0
          puts "Input the name of the cigarette you smoke"
          cig = gets.chomp
          puts "Input the price of the cigarettte"
          price = gets.chomp.to_i
          cigarette = quit_smoking.cigarette.add_cigarette(cig, price)
        end
        user['cigarette_id'] = cigarette
        puts "how many cigarettes do you smoke a day?"
        user['ave_cig_cons'] = gets.chomp.to_i
        user['updated_at'] = Date.today.to_s
        user['created_at'] = Date.today.to_s
        quit_smoking.user.sign_up(user)
        puts "Welcome #{quit_smoking.user.name}, Your ID is #{quit_smoking.user.id}, which is needed to sign in."
        quit_smoking.logged_in = true
      when 2
        puts "Please enter your name"
        name = gets.chomp
        puts "Please enter your id"
        id = gets.chomp.to_i
        if quit_smoking.user.sign_in(id, name)
          puts "Hello #{quit_smoking.user.name}."
          quit_smoking.logged_in = true
        else
          puts "Your name and/or id are invalid.\n"
        end
      else
        puts "Please input number (0 or 1)"
      end
      next
    end
      puts "select number, or type 'exit'"
      puts "1: Record smoking"
      puts "2: Display daily logs so far"
      puts "3: Calculate total money you spent for cigarettes since you started 'Smoking-log'"
      puts "4: Delete account"
    input = gets.chomp
    exit if input == 'exit'
    next if input.to_i == 0
  case input.to_i
  when 1
    puts "Enter the number of cigarettes you smoked"
    num_of_cigs = gets.chomp.to_i
    quit_smoking.record(num_of_cigs)
    puts "You smoked #{quit_smoking.get_total_today} cigarettes in total today"
  when 2
    logs = quit_smoking.get_logs
    logs.each do |log|
      puts "#{log['recorded_at']} : #{log['smoking_record']}"
    end
    puts "You smoke #{quit_smoking.get_average} cigarettes on average"
  when 3
    puts "You have spent #{quit_smoking.calc_total_payments} dollers for sigarettes in total"
  when 4
    puts "Are you sure? yes/no"
    ans = gets.chomp
    if ans == "yes"
      quit_smoking.user.delete
    end
  else
    puts "Please input number (1 ~ 4) or exit"
  end
end
