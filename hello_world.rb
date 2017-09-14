require 'rubygems'
require 'bundler/setup'
require 'sinatra'

set(:probablity) { |value| condition{rand < value}}

class Stream
	def each
		100.times { |i| yield "#{i} \n"}
	end
end

get '/hello/:name' do
	"Hello #{params[:name]}"
end

get '/say/*/to/*' do
	"Send a big #{params['splat'][0]} to #{params['splat'][1]}"
end

get '/' do
	request.url
end
get '/win_a_car', :probablity => 1 do
	"Congratulations! You won!"
end

get '/win_a_car' do
	"Sorry, you lost"
end
