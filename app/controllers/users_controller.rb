class UsersController < ApplicationController

def login
  @user = User.find_by Username: (params[:user])
  if @user != nil and @user.Password == params[:password]
    @user.count += 1
    @user.save
    render json: @user = Response.new(@user.count, 1)
  else
    render json: @user = Response.new(-1)
  end
end

def add
  @username = params[:user]
  @password = params[:password]
  @user = User.find_by Username: (params[:user])
  if @username.length == 0 or @username.length > 128
    render json: @user = Response.new(-3)
  elsif @password.length > 128
    render json: @user = Response.new(-4)
  elsif @user == nil
    @user = User.create(Username: @username, Password: @password, count: 1)
    render json: @user = Response.new(1, 1)
  else
    render json: @user = Response.new(-2)
  end
end

end

class Response
  def initialize(count = false, errCode)
    if count
      @count = count
    end
    @errCode = errCode
  end

end
