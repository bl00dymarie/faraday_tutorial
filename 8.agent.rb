#!/usr/bin.ruby

require 'faraday'

con = Faraday.get do |r|
  r.url 'http://localhost:4567/agent'
  r.headers[ 'User-Agent' ] = 'Ruby script'
end

puts con.body

# The server responded with the name of the agent that we have sent with the request.


# require 'faraday'
#
# con = Faraday.new
#
# res = con.get do |req|
#     req.url 'http://localhost:4567/agent'
#     req.headers['User-Agent'] = 'Ruby script'
# end
#
# puts res.body
