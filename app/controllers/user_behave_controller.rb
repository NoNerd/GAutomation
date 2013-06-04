#encoding: utf-8

class UserBehaveController < ApplicationController
  # before_filter :authorize
  
  def login
  end

  def try_login
           @result =User.where(["username = ? and password = ? ", params[:name],params[:password]])
          if   @result.length == 0
               redirect_to  login_path , notice:  "登录失败，检查用户名和密码"
                else
           session[:user] = @result.first
          redirect_to root_path
          end
  end

  def logout
          session[:user] = nil
          redirect_to root_path
  end
  
  def authorize
           
  end
  
end
