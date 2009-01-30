#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sequel'

configure do
  Sequel.connect('sqlite://snippets.db')
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
require 'snippet'

before do
  @most_recent = Snippet.most_recent
  @most_viewed = Snippet.most_viewed
end

get '/' do
  @snippets = Snippet.all
  haml :index
end

get '/stylesheets/layout.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :layout
end
