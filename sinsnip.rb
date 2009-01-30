#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sequel'

configure do
  Sequel.connect('sqlite://snippets.db')
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
require 'snippet'
require 'helpers'

before do
  @most_recent = Snippet.most_recent
  @most_viewed = Snippet.most_viewed
  @tags = Snippet.map(:tags).join(' ').split.uniq.sort
end

get '/' do
  @snippets = Snippet.all
  haml :main
end

get '/stylesheets/layout.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :layout
end

get '/s/:snip' do
  @snippet = Snippet[params[:snip]]
  halt [ 404, "Page not found" ] unless @snippet
  @snippet.view!
  haml :show
end

get '/t/:tag' do
  @tag = params[:tag]
  @snippets = Snippet.filter(:tags.like("%#{@tag}%"))
  haml :tagged
end
