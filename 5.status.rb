#!/usr/bin/ruby

require 'faraday'

response = Faraday.get 'http://www.something.com'
puts response.status
puts response.success?

response = Faraday.get 'http://www.something.com/news'
puts response.status
puts response.success?

response = Faraday.get 'http://www.urbandictionary.com/define.php?term=Dog'
puts response.status
puts response.success?

# def display_status_success(url)
#   response = Faraday.get 'url'
#   puts response.status
#   puts response.success?
# end
#
# display_status_success('http://www.something.com')

# The status method of the Faraday::Response returns the HTTP status code of the response.
#
# We perform three HTTP requests with the get method and check for returned status.
#
# response = Faraday.get 'http://www.something.com'
# puts response.status
# The status of the HTTP response is checked with the status method.
#
# puts response.success?
# The success? method tells whether the status code was successful.
