require 'sinatra/base'
require 'player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    session[:player1] = params[:player1]
    session[:player2] = params[:player2]
    redirect '/play'
  end

  get '/play' do
    $player1 = Player.new(session[:player1])
    $player2 = Player.new(session[:player2])
    erb :play
  end

  get '/attack' do
    $player1 = Player.new(session[:player1])
    $player2 = Player.new(session[:player2])
    erb :attack
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
