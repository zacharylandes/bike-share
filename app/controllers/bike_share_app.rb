require 'will_paginate'
# require 'pry'
require 'will_paginate/active_record'


class BikeShareApp < Sinatra::Base
  configure{ register WillPaginate::Sinatra}
  set :method_override, true

  get '/' do
    erb :welcome
  end

  get '/trips' do
    @trips = Trip.paginate(page: params[:page], per_page: 30)
    erb :"trips/index"
  end

  get '/trips/new' do
    erb :"trips/new"
  end

  post '/trips/new' do
    trip = Trip.create(params[:trip])
    redirect '/trips'
  end


   get '/trips/:id' do
     @trip = Trip.find(params[:id])
     erb :"trips/show"
   end

  put '/trips/:id' do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trips"
  end

  get '/trips/:id/edit' do
    @trip = Trip.find(params[:id])
    erb :"trips/edit"
  end

  delete '/trips/:id' do |id|
    trip = Trip.destroy(id.to_i)
    redirect '/trips'
  end

  get '/trips-dashboard' do
    @trips = Trip.all
    # binding.pry
    erb :"trips/dashboard"
  end

  get '/stations' do
    @stations = Station.all
    erb :"stations/index"
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
    @trips = Trip.group(:start_station_id).order("count_id DESC").count(:id)
    # binding.pry
    erb :"stations/show"
  end

  delete '/stations/:id' do |id|
    station = Station.destroy(id.to_i)
    redirect '/stations'
  end


end
