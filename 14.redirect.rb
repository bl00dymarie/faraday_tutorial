#!/usr/bin/ruby

require 'faraday'
require 'faraday_middleware'

# con = Faraday.new 'http://localhost:4567/oldpage' do |con|
#     con.use FaradayMiddleware::FollowRedirects, limit: 5
# end
#
# res = con.get
# puts res.body

con = Faraday.get 'http://localhost:4567/oldpage'

puts con.body
puts con.headers
