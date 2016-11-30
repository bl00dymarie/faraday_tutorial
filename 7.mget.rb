#!/usr/bin/ruby

require 'faraday'

con = Faraday.get 'http://localhost:4567/greet', { :name => 'Peter' }

puts con.body

# Sending request out to http with params name is Peter to display / get the response body of this endpoint.
