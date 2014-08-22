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
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
    when 'a'
      add
    when 'l'
      list
    when 'd'
      delete_emp
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

welcome
