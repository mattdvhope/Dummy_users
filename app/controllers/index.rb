get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/create_new_user' do
  erb :create_new_user
end

post '/completion' do
  @user = User.create(params[:user_input])
end


