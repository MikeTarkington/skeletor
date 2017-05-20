get '/sessions' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.authenticate(params[:username], params[:password_string])
  if user
    login(user)
    redirect "/questions"
  else
    @errors = ['Incorrect login information']
    erb :'/sessions/new'
  end
end

get '/logout' do
  logout
  redirect '/'
end

