#!/usr/bin/ruby

require 'faraday'

con = Faraday::Connection.new 'http://heartofcode.org'

response = con.get

puts response
puts "=====>"
puts response.body.gsub(%r{</?[^>]+?>}, '')

# displays the website without annoying html tags all around

# This program gets a small web page and strips its HTML tags.
# The script strips the HTML tags of the www.something.com web page.
# The script prints the web page's title and content.
