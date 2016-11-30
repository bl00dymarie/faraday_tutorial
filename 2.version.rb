#!/usr/bin/ruby

require 'faraday'

puts Faraday::VERSION
puts Faraday::default_adapter

# This program prints the version of the library and of the Ruby language.
# The two constants provide the library version number and the default Faraday adapter.
#
# $ ruby version.rb
# > 0.9.2
# > net_http
# This is a sample output of the string.
