require 'sinatra'
require 'json'
require_relative 'service'
require 'uri'

before do
  content_type 'text/html'
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST','PUT'],
          'Access-Control-Allow-Headers' => ['Content-Type', "x-requested-with", "origin"]
end
set :protection, false

options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

put '/assertion/evaluate' do
  content_type 'text/plain'
  script = request.body.read
  URI.escape(LookLike::Service.execute(script).join("<---->"))
end
