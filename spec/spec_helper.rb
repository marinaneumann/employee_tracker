require 'active_record'
require 'rspec'
require 'divisions'
require 'employees'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy}
  end
end
