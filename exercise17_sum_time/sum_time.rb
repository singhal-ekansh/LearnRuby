# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
class Time
  @@day_count = 0
  VALID_TIME_REGEXP =  /^([01]?[0-9]|2[0-3]):[0-5]?[0-9]:[0-5]?[0-9]$/.freeze
  def str_to_seconds(time_in_string)
    time_array = time_in_string.split(':')
    hr = time_array[0].to_i
    min = time_array[1].to_i
    sec = time_array[2].to_i
    hr * 60 * 60 + min * 60 + sec
  end

  def add_time(time_array)
    return 'Invalid 24-hour time value' if !time_array.all? VALID_TIME_REGEXP

    time_now_seconds = str_to_seconds(strftime('%H:%M:%S'))
    total_seconds = time_array.inject(0) { |memo, time| memo + str_to_seconds(time) }
    new_time = self + total_seconds - time_now_seconds
    @@day_count += ((total_seconds)/(24*60*60)).to_i  #calculate days changed
    new_time.to_s
  end

  def to_s
    if @@day_count.positive?
      "#{@@day_count} #{@@day_count>1 ? 'days' : 'day'} & #{strftime('%H:%M:%S')}"
    else
      strftime('%H:%M:%S')
    end
  end
end

if ARGV.length.zero?
  puts 'Please provide an input'
else
  puts Time.new.add_time(ARGV).inspect
end