require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
    get '/' do
    'Welcome to Chitter. Please sign up'
  end
  get '/peeps' do
   p  @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :newpeep
  end

  post '/peeps' do
    Peep.create(text: params['text'])
    p redirect '/peeps'
  end

  run! if app_file == $0
end