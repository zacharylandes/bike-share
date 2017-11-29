require 'pry'
class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/stations/new' do
    erb :new
  end

  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :edit
  end

  post '/stations/new' do
    station = Station.create(params[:station])
    redirect '/stations'
  end

  put '/stations/:id' do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  get '/stations/:id' do
    @station = Station.find(params[:id])
    erb :show
  end

  delete '/stations/:id' do |id|
    station = Station.destroy(id.to_i)
    redirect '/stations'
  end



end
