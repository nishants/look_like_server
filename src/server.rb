require 'sinatra'
require 'json'
require_relative 'service'

CONFIG_PATH = "config"
service = RubyLab::Service.new CONFIG_PATH
before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST','PUT'],
          'Access-Control-Allow-Headers' => ['Content-Type', "x-requested-with", "origin"]
end
set :protection, false

options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

get '/assertion/evaluate' do
  content_type 'text/plain'
  snippet = eval(request.body.read)
  LookLike::Service.execute(snippet)
end
