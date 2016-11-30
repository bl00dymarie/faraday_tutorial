#!/usr/bin/ruby

require 'faraday'

con = Faraday.post 'http://localhost:4567/target', { :name => 'Maria' }

puts con.body
