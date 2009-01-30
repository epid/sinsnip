#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  haml :index
end

get '/stylesheets/layout.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :layout
end
