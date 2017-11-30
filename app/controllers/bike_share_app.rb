require 'pry'
class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all
    erb :index
  end

  get '/trips' do
    @trips = Trip.all
    erb :index_trip
  end

  get '/trips/new' do
    # require 'pry';binding.pry
    erb :new_trip
  end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :show_trip
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :edit_trip
  end


  get '/station-dashboard' do
    @stations = Station.all

    erb :dashboard
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
