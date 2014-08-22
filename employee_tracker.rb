require 'active_record'
require './lib/employees'
require './lib/divisions'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the Employee Tracker"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add employee, 'l' to list all employees and 'd' to delete an employee."
    puts "Press 'm' to add a division, 's' to list a division and'n' to delete a division."
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'd'
      delete_emp
    when 'm'
      add_d
    when 's'
      list_d
    when 'n'
      delete_div
    when 'e'
      puts "Good-bye!"
    else
      puts "Please put a valid option!!"
    end
  end
end

def add
  puts "What employee would you like to add?"
  employee_name = gets.chomp
  employee = Employee.new({:name => employee_name})
  employee.save
  puts " '#{employee_name}' has been added to the system."
end

def list
  puts "Here are all the employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
end

def delete_emp
  puts "Here are all the employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
    puts "Which employee would you like to delete?"
    employee_delete = gets.chomp
    fired_employee = Employee.where({:name => employee_delete}).first
    fired_employee.delete
end

def add_d
  puts "What division would you like to add?"
  division_name = gets.chomp
  division = Division.new({:name => division_name})
  division.save
  puts " '#{division_name}' has been added to the system."
end

def list_d
  puts "Here are all the divisions:"
  divisions = Divisions.all
  divisions.each { |division| puts division.name}
end

def delete_div
  puts "Here are all the divisions:"
  divisions = Divisions.all
  divisions.each { |division| puts division.name}
    puts "What division would you like to delete?"
    division_delete = gets.chomp
    dead_div = Division.where({:name => division_delete}).first
    dead_div.delete
end

welcome
