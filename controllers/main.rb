#______________________________________________________________________________________________________________________#
#                                                                                                                      #
#                                                      MAIN                                                            #
#______________________________________________________________________________________________________________________#

get "/home" do

  if session[:user_id]
  else
    redirect "/login"
  end

  erb :"main/homepage"
end


get "/login" do
  erb :"main/login"
end


get "/login_validation" do
  user_name = params["user_name"]
  a = CONNECTION.execute("SELECT password FROM users WHERE name = '#{user_name}'")
  a = a[0]["password"]

  user_password = BCrypt::Password.new(a)

  if params["password"] == user_password
    session[:user_id] = 1
  else
    session[:user_id] = 0
  end

end