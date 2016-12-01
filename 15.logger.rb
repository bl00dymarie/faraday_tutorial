#!/usr/bin/ruby

require 'faraday'
require 'logger'

class MyLogger

    def initialize(app)
        @app = app
        @logger = Logger.new(STDOUT)
    end

    def call(env)
        on_request("request", env)
        @app.call(env).on_complete do
            on_response("response", env)
        end
    end

    private
    def on_request(phase, env)
        @logger.info("#{phase} : #{env.method} - #{env.url}") if env.method and env.url
    end

    private
    def on_response(phase, env)
        @logger.info("#{phase} : #{env.body}") if env.body
    end
end

con = Faraday.new(:url => "http://localhost:4567") do |build|
    build.request :url_encoded
    build.use MyLogger
    build.adapter  Faraday.default_adapter
end

res = con.get "/greet", {'name' => 'Iva'}
