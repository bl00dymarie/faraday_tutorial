#!/usr/bin/ruby

require 'faraday'

con = Faraday.post do |req|
  req.url 'http://localhost:4567/readjson'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{ "name": "Jane", "age": 17 }'
end

puts con.headers
puts con.body
