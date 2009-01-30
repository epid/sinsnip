#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sequel'
require 'coderay'

configure do
  Sequel.connect('sqlite://snippets.db')
  PREVIEW_LINES = 2
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

get '/new' do
  haml :edit, :locals => { :snippet => Snippet.new, :url => '/new' }
end

post '/new' do
  snippet = Snippet.new( :title => params[:title], :tags => params[:tags], :body => params[:body], :language => 'text' )
  snippet.save
  redirect "/s/#{snippet.id}"
end

get '/e/:id' do
  haml :edit, :locals => { :snippet => Snippet[params[:id]], :url => "/e/#{params[:id]}" }
end

post '/e/:id' do
  snippet = Snippet[params[:id]]
  snippet.title = params[:title]
  snippet.tags = params[:tags]
  snippet.body = params[:body]
  # TODO snippet.language = params[:language]
  snippet.updated_at = Time.now
  snippet.save
  redirect "/s/#{snippet.id}"
end
