#!/usr/bin/ruby

require 'faraday'

c = Faraday.new 'http://www.something.com'

r = c.head

# puts response.headers['server']
# puts response.headers['date']
# puts response.headers['last-modified']
# puts response.headers['content-type']
# puts response.headers['content-length']

r.headers.each do |a|
  puts a
  puts " "
end
