#!/usr/bin/ruby

require 'faraday'

con = Faraday.new :url => 'http://localhost:4567/secure'
# con = Faraday.get 'http://localhost:4567/secure'

usr = 'user7'
pw = '7password'

con.basic_auth  usr, pw

puts con.get.body
