# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Time
  @@day_count = 0
  
  def str_to_seconds(time_in_string)
    time_array = time_in_string.split(':')
    hr = time_array[0].to_i
    min = time_array[1].to_i
    sec = time_array[2].to_i
    total_sec = hr*60*60 + min*60 + sec
  end

  def add_time(time_one , time_two)
    time_now_seconds = str_to_seconds(self.strftime("%H:%M:%S"))
    time_one_seconds = str_to_seconds(time_one)
    time_two_seconds = str_to_seconds(time_two)
    new_time = self + time_one_seconds + time_two_seconds - time_now_seconds
    @@day_count += new_time.day - self.day
    new_time
  end

  def to_s
    if @@day_count > 0
      "#{@@day_count} day & #{self.strftime("%H:%M:%S")}"
    else
      self.strftime("%H:%M:%S")
    end
  end
  
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  VALID_TIME_REGEXP =  /^([0-9]|0[0-9]|1[0-9]|2[0-3]):([0-9]|[0-5][0-9]):([0-9]|[0-5][0-9])$/
  time_one = ARGV[0].to_s
  time_two = ARGV[1].to_s
  if VALID_TIME_REGEXP.match(time_one) && VALID_TIME_REGEXP.match(time_two)
    puts Time.new.add_time(time_one,time_two).to_s.inspect
  else
    puts 'Invalid 24-hour time value'
  end
end