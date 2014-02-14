require 'test_helper'
require 'securerandom'

class UserTest < ActiveSupport::TestCase
  test "should not save post without title" do
    user = User.new
    assert !user.save, "Saved the user without a username"
  end

  test "can create a user" do
    @username = SecureRandom.hex
    @password = 'password'
    @count = 1
    @user = User.create(Username: @username, Password: @password, count: @count)

    assert @user.Username == @username, "Different username"
    assert @user.Password == @password, "Different password"
    assert @user.count == @count, "Different count"
  end

  test "can save a user" do
    @username = SecureRandom.hex
    @password = 'password'
    @count = 1
    @user = User.create(Username: @username, Password: @password, count: @count)
    @user2 = User.find_by Username: @username
    
    assert @user2 == @user, "Didn't find the user"
    assert @user2.Username == @user.Username, "Different username"
    assert @user2.Password == @user.Password, "Different password"
    assert @user2.count == @user.count, "Different count"
  end

  test "can increment count" do
    @username = random_string = SecureRandom.hex
    @password = 'password'
    @count = 1
    @user = User.create(Username: @username, Password: @password, count: @count)
    
    @user.count += 1
    @user.save

    @user = User.find_by Username: @username
    assert @user.count == @count + 1, "Count didn't increment"
  end
end
