get '/' do
  @users = User.all
  erb :'skeletor'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  if params[:user][:password] == ""
    @errors = ["Password cannot be blank."]
    erb :'users/new'
  else
    user = User.new(params[:user])
    if user.save
      login(user)
      redirect '/'
    else
      @errors = user.errors.full_messages
      erb :'users/new'
    end
  end
end

get '/users/:id' do
  if logged_in?
    @user = User.find(current_user.id)
    # @user_stuff = @user.stuff
    erb :'users/show'
  end
end
