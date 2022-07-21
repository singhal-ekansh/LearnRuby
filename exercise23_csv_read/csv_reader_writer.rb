# Using Ruby version: ruby 2.7.1p83 (2020-03-31 revision a0c7c23c9c) [x86_64-linux]
# Your Ruby code here
require 'csv'
class Employee
  attr_accessor :name, :empid, :designation
  def initialize(name, empid, designation)
    @name = name
    @empid = empid
    @designation = designation
  end
end

class EmployeeCsvGenerator
  
  def initialize
    @employee_list = []
    @input_file = CSV.read('input_data.csv', headers: true, header_converters: :symbol)
    @output_file = File.open('output_data.txt', 'w')
  end

  def process
    read_file
    generate_csv
  end

  def read_file
    @input_file.each { |row| @employee_list.push(Employee.new(row[:name], row[:empid], row[:designation])) }
  end
  
  def add_to_output(designation, employes)
    @output_file.puts designation.strip + (employes.size > 1 ? 's' : '')
    employes.each do |person|
      @output_file.puts "#{person.name.strip} (Empid: #{person.empid.strip})"
    end 
    @output_file.puts
  end

  def generate_csv
    list = sort_employees
    list.each {|ele| add_to_output(ele[0], ele[1].sort_by(&:empid))}
  end

  def sort_employees
    @employee_list.group_by(&:designation).sort
  end
end

EmployeeCsvGenerator.new.process