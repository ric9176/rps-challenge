require 'sinatra/base'

class Rps < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

 	post '/names' do
 	session[:name] = params[:name]
  redirect '/play'
 	end

  get '/play' do
    @turn = Turn.new(session)

    @name = session[:name]
    @shape = session[:shape]
    @opponent_shape = session[:opponent_shape]
    erb :play
  end

  post '/play' do
    session[:shape] = params[:shape]
    session[:opponent_shape] = Opponent.new.shape
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
