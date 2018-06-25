require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
	  user = User.new name: "Admin A", type: "Admin", password: "password"
	  assert_not user.save
	end

	test "should not save user without type" do
	  user = User.new name: "Example", email: "example@taskmanager.com", password: "password"
	  assert_not user.save
	end

	test "should not save user without name" do
	  user = User.new email: "admin@taskmanager.com", type: "Admin", password: "password"
	  assert_not user.save
	end

	test "should not save user with duplicate emails" do
	  user = User.new name: "Admin A", email: "admin@taskmanager.com", type: "Admin", password: "password"
	  assert user.save
	  user1 = User.new name: "Admin B", email: "admin@taskmanager.com", type: "Admin", password: "password"
	  assert_not user1.save
	end

	test "should save user" do
		user = User.new name: "Admin A", email: "admin@taskmanager.com", type: "Admin", password: "password"
	  assert user.save
	end

	test "should return true if type developer" do
		user = User.new name: "Admin A", email: "admin@taskmanager.com", type: "Developer", password: "password"
	  user.save
	  assert user.developer?
	end

	test "should return true if type admin" do
		user = User.new name: "Admin A", email: "admin@taskmanager.com", type: "Admin", password: "password"
	  user.save
	  assert user.admin?
	end

	test "should return false if type not developer" do
		user = User.new name: "Admin A", email: "admin@taskmanager.com", type: "Admin", password: "password"
	  user.save
	  assert_not user.developer?
	end

	test "should return false if type not admin" do
		user = User.new name: "Admin A", email: "admin@taskmanager.com", type: "Developer", password: "password"
	  user.save
	  assert_not user.admin?
	end
end
