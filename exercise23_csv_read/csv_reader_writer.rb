# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
require 'csv'
class Csvformatter
  def read_file
    input_file = CSV.read('input_data.csv', headers: true, header_converters: :symbol)
    output_file = CSV.open('output_data.csv', 'w')
    map_designation = Hash.new { |h, k| h[k] = [] }

    input_file.each { |row| map_designation[row[:designation]] << [row[:name], row[:empid]] }
    map_designation.sort.each do |position|
      output_file << [position[0].strip + (position[1].size > 1 ? 's' : '')]
      position[1].sort_by { |_name, id| id }.each do |detail|
        output_file << ["#{detail[0].strip} (Empid: #{detail[1].strip})"] 
      end
      output_file << []
    end
    output_file.close
  end
end

Csvformatter.new.read_file