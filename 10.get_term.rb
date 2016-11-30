#!/usr/bin/ruby

require 'faraday'
require 'nokogiri'

term = 'menstruation'
con = Faraday.get 'http://www.dictionary.com/browse/'+term

doc = Nokogiri::HTML con.body
doc.css("div.def-content").map do |node|
    s = node.text.strip!
    s.gsub!(/\s{3,}/, " ") unless (s == nil)
    puts s unless (s == nil)
end
