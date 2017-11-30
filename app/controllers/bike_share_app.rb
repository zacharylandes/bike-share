require 'pry'
class BikeShareApp < Sinatra::Base

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
  end

  get '/trips' do
    @trips = Trip.all
    erb :"trips/index"
  end

  get '/trips/new' do
    # require 'pry';binding.pry
    erb :"trips/new"
  end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end

  get '/trips/:id' do
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end


  get '/station-dashboard' do
    @stations = Station.all

    erb :"stations/dashboard"
  end

  get '/stations/new' do
    erb :"stations/new"
  end


  get '/stations/:id/edit' do
    @station = Station.find(params[:id])
    erb :"stations/edit"
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
    erb :"stations/show"
  end

  delete '/stations/:id' do |id|
    station = Station.destroy(id.to_i)
    redirect '/stations'
  end


end
