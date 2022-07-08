# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Time
  VALID_TIME_REGEXP = /^([01]?[0-9]|2[0-3]):[0-5]?[0-9]:[0-5]?[0-9]$/.freeze
  
  def self.time_to_seconds(time_object)
    time_object.hour * 60 * 60 + time_object.min * 60 + time_object.sec
  end
  
  def self.time_array_to_seconds(time_string_array)
    total_seconds = 0
    time_string_array.each do |time_string|
      time_indexs = time_string.split(':')
      time_obj = Time.new(2000,01,01,time_indexs[0].to_i,time_indexs[1].to_i,time_indexs[2].to_i)
      total_seconds += time_to_seconds(time_obj)
    end
    total_seconds
  end

  def self.add_time(time_array)
    return 'Invalid 24-hour time value' unless time_array.all? VALID_TIME_REGEXP

    start_time = Time.new(2000,01,01,0,0,0)
    total_seconds = time_array_to_seconds(time_array)
    new_time = start_time + total_seconds
    day_count = total_seconds / (24 * 60 * 60).to_i # calculate days changed
    display(new_time, day_count)
  end

  def self.display(time, day_count)
    if day_count.positive?
      "#{day_count} #{day_count > 1 ? 'days' : 'day'} & #{time.strftime('%H:%M:%S')}"
    else
      time.strftime('%H:%M:%S')
    end
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  puts Time.add_time(ARGV).inspect
end