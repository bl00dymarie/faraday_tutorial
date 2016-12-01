#!/usr/bin/ruby

require 'faraday'
require 'faraday_middleware'

con = Faraday.new 'http://localhost:4567/oldpage' do |con|
    con.use FaradayMiddleware::FollowRedirects, limit: 5
    con.adapter Faraday.default_adapter
end

res = con.get
puts res.body
puts res.body.gsub(%r{</?[^>]+?>}, '')
