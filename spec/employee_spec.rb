require 'spec_helper'

describe Employee do
  it "belongs to a division" do
    division = Division.create({:name => 'Marketing'})
    employee = Employee.create({:name => 'Arthur Schloop', :division_id => division.id})
    employee.division.should eq division
  end
end
