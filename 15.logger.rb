#!/usr/bin/ruby

require 'faraday'
require 'logger'

class MyLogger

    def initialize(app)
        @app = app
        @logger = Logger.new(STDOUT)
    end

    # Here we create a middleware that implements logging to the console:
    def call(env)
        on_request("request", env)
        @app.call(env).on_complete do
            on_response("response", env)
        end
    end

    # A middleware must implement the call method. It executes a method for a request and for a response.

    private
    def on_request(phase, env)
        @logger.info("#{phase} : #{env.method} - #{env.url}") if env.method and env.url
    end

    # Upon generation of a request, the on_request method is called. The method logs the phase, request method, and URL.

    private
    def on_response(phase, env)
        @logger.info("#{phase} : #{env.body}") if env.body
    end
end

# The MyLogger middleware is added to the stack with the use method.
# When a connection object executes a request, it creates a shared env hash,
# wraps the outer middlewares around each inner middleware, and executes the call method.

con = Faraday.new(:url => "http://localhost:4567") do |build|
    build.request :url_encoded
    build.use MyLogger
    build.adapter  Faraday.default_adapter
end

res = con.get "/greet", {'name' => 'Iva'}
