require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@admin = User.create name: "Example", email: "example@taskmanager.com", type: "Admin", password: "helloo"
  end

  test "should have name" do
  	@project = Project.new name: "", user_id: @admin.id
  	assert_not @project.save
  	@project1 = Project.new name: "Project A", user_id: @admin.id
  	assert @project1.save
  end

  test "should belongs to admin" do
  	@developer = User.create name: "Example", email: "example@taskmanager.com", type: "Developer", password: "helloo"
  	@project = Project.new name: "Project A", user_id: @developer.id
  	assert_not @project.save
  	@project.user_id = @admin.id
  	assert @project.save
  end

end
