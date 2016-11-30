#!/usr/bin/ruby

require 'faraday'

response = Faraday.get 'http://heartofcode.org'

puts response.headers
puts " "
puts response.body.gsub(%r{</?[^>]+?>}, '')
puts " "
puts response.body
puts "= == === ==== ===== >"
puts response

# The get method fetches documents identified by the given URL.
#
# The script grabs the content of the www.something.com web page.
#
# $ ruby get_content.rb

# {"date"=>"Mon, 28 Nov 2016 10:19:41 GMT", "server"=>"Apache/2.4.12 (FreeBSD) OpenSSL/1.0.1l-freebsd mod_fastcgi/mod_fastcgi-SNAP-0910052141",
# "last-modified"=>"Mon, 25 Oct 1999 15:36:02 GMT", "etag"=>"\"4d-357b661867c80-gzip\"", "accept-ranges"=>"bytes", "vary"=>"Accept-Encoding",
# "content-length"=>"72", "connection"=>"close", "content-type"=>"text/html"}
#
# Something.
# Something.
#
# <html><head><title>Something.</title></head>
# <body>Something.</body>
# </html>
# This is the output of the get_content.rb script.
