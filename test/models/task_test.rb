require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@user = User.create name: "Example", email: "example@taskmanager.com", type: "Admin", password: "helloo"
  	@project = Project.create name: "Project A", user_id: @user.id
  end

  test "should have project_id" do
  	task = Task.new name: "TODO a1", project_id: @project.id
  	assert task.save
  	task1 = Task.new name: "TODO a2", project_id: nil
  	assert_not task1.save
  end

  test "should have name" do
  	task = Task.new name: "TODO a1", project_id: @project.id
  	assert task.save
  	task1 = Task.new name: "", project_id: @project.id
  	assert_not task1.save
  end
end
