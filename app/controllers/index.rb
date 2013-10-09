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
#Logging in a Returning User

post '/auth_user' do

  redirect to '/' if User.find_by_user_name(params[:user]).nil?
  
  @returning_user = User.find_by_user_name(params[:user])

  if @returning_user.password == params[:password_for_user]
    session[:id] = @returning_user.id
    p session
    erb :welcome_page # to send them after they log in
  else
    redirect to '/'
  end
end

#add a logout session via <a href> on new page return home
get '/bye' do
  session.clear
  p session
  redirect to '/'
end






