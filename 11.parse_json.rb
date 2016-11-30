#!/usr/bin/ruby

require 'faraday'
require 'json'

# con = Faraday.get 'http://localhost:4567/example.json'
#
# data = JSON.parse con.body

con = Faraday.get 'http://localhost:4567/example.json'

data = JSON.parse con.body

puts data["name"]
puts data["age"]
