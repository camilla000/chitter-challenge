require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
   enable :sessions, :method_override

  get '/' do
    @user = session[:user]
    'Welcome to Chitter'
    erb :homepage
  end

  get '/register' do
    erb :register
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    session[:name] = user.name
    redirect '/peeps'
  end

  get '/peeps' do
    @name = session[:name]
    @peeps = Peep.all
    @peeps = Peep.reverse
    erb :index
  end

  get '/peeps/new' do
    erb :newpeep
  end

  post '/peeps' do
    Peep.create(text: params['text'])
    p redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end
  run! if app_file == $0
end