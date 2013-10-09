#Homepage

get '/' do
  # Look in app/views/index.erb
  erb :index
end

#-------------------
#Create New User page

get '/create_new_user' do
  erb :create_new_user
end

#-------------------
#Creating a New User and Redirecting to Completion Page

post '/completion' do
  user = User.create(params[:user_input])
  redirect to "completion/#{user.id}"
end

get '/completion/:id' do
 @new_user = User.find(params[:id])
 erb :new_user_page
end

#-------------------
#Logging in a Returning

post '/auth_user' do
  returning_user = User.find_by_user_name(params[:user])

  if returning_user.password == params[:password_for_user]
    returning_user = User.find(params[:user])
    redirect to "completion/#{returning_user.id}"
  else
    redirect to '/'
  end
end
