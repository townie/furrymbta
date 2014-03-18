require 'sinatra'
require 'csv'
require 'pry'
require 'net/http'
require 'json'

@location={long:0,lat:0}

#home page request
get '/' do
  erb :personal
end

post '/loc' do

  erb '/params[:long]'
end

get '/:long' do
  erb :bus
end

post '/bus' do
    uri = URI("http://realtime.mbta.com/developer/api/v1/stopsbylocation?api_key=U1N8k74hBkK874ory82gZg&lat=#{params["lat"]}&lon=#{params["long"]}")
  req = Net::HTTP::Get.new(uri)
  req['Accept'] = 'application/json'

  res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(req)
  end

  results = JSON.parse(res.body)
  @results = results["stop"]
  @stops = []
  @results.each do |stop|
      @stops << stop["stop_id"]
 end



  erb :bus
end

get '/train' do
  erb :train
end

get '/bus_train' do
  erb :bus_train
end
