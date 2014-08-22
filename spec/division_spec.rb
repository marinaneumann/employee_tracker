require 'spec_helper'

describe Division do
  it "has many employees" do
    division = Division.create({:name => 'Production'})
    employee1 = Employee.create({:name => 'Hungry Mouse', :division_id => division.id})
    employee2 = Employee.create({:name => 'Sleepy Goat', :division_id => division.id})
    division.employees.should eq [employee1, employee2]
  end
end
