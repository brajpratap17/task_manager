require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@admin = Admin.create name: "Example", email: "example@taskmanager.com", password: "helloo"
  	@developer = Developer.create name: "Example1", email: "example1@taskmanager.com", password: "helloo"
  	@project = @admin.projects.create name: "Project"
  end

  test "should have developer" do
  	@assignment = Assignment.new user_id: nil, project_id: @project.id
  	assert_not @assignment.save
  	@assignment.user_id = @admin.id
  	assert_not @assignment.save
  	@assignment.user_id = @developer.id
  	assert @assignment.save
  end

  test "should have project" do
  	@assignment = Assignment.new user_id: @developer.id, project_id: nil
  	assert_not @assignment.save
  	@assignment.project_id = @project.id
  	assert @assignment.save
  end

end
