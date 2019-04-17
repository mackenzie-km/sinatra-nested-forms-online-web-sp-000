require './environment'
require_relative 'app/models/pirate'
require_relative 'app/models/ship'


module FormsLab
  class App < Sinatra::Base
    attr_accessor :pirate, :ship

    set :views, settings.root + '/views/pirates'

    get '/' do
      erb :index
    end

    get '/new' do
      erb :new
    end

    post '/pirates' do
      puts params
      Pirate.new(params[:pirate][:name], params[:pirate][:weight], params[:pirate][:height])
      params[:pirate][:ships].collect do |ship|
        Ship.new(ship[:name], ship[:type], ship[:booty])
      end
      set :views, settings.root + '/views/pirates'
      erb :show
    end
  end
end
