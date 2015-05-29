require 'sinatra'
require 'sinatra/json'
require 'httparty'
require 'pry'

get '/api/v1/tags' do
  response = HTTParty.get('https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&site=stackoverflow')
  tags = Hash.new 0
  questions = response["items"]
  questions.each do |question|
    question["tags"].each do |tag|
      tags[tag] += 1
    end
  end
  json tags
end
