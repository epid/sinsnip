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

__END__

@@ index
!!! Strict
%html{:xmlns => 'http://www.w3.org/1999/xhtml'}
  %head
    %meta{'http-equiv' => 'Content-Type', :content => 'text/html;charset=utf-8'}/
    %title SinSnip - A simple code snippet manager
    %link{:rel => 'stylesheet', :href => '/stylesheets/layout.css', :type => 'text/css', :media => 'screen'}
  %body
    #container
      #header
        %h1 SinSnip
        %h2 A simple code snippet manager
      #main
        .snip
          .snip_title Snippet 1
          .snip_body
            %pre
              :preserve
                My first snippet
                Line 2
                Here is a long(ish) line - Let's see how it looks when it needs to wrap
          .snip_foot
            .snip_lang ruby
            .snip_tags
              Tags:
              %a{:href => 't/tag1'}tag1
              %a{:href => 't/tag2'}tag2
        .snip
          .snip_title Snippet 2
          .snip_body
            %pre My second snippet
          .snip_foot
            .snip_lang text
            .snip_tags Tags: tag2 tag3 tag4
        .snip
          .snip_title Snippet 3
          .snip_body
            %pre Also, I'd like to see how the software handles the situation when text is really long and wraps lines
          .snip_foot
            .snip_lang rails
            .snip_tags Tags: tag4 tag5
        .snip
          .snip_title Snippet 4
          .snip_body
            %pre My fourth snippet
          .snip_foot
            .snip_lang sql
            .snip_tags Tags: tag5 tag6 tag7
      #sidebar
        %a{:href => '/new', :id => 'button'} New Snippet
        %p
        .side_section
          %h4 Most Recent
          %ul
            %li
              %a{:href => 's/1'}
                .title Snippet 1
                .info 4 hours ago
            %li
              %a{:href => 's/2'}
                .title Snippet with a long title
                .info 16 days ago
            %li
              %a{:href => 's/3'}
                .title Snippet with a ridiculously long title
                .info 10 months ago
        .side_section
          %h4 Most Viewed
          %ul
            %li
              %a{:href => 's/2'}
                .title Snippet 2
                .info viewed 12 times
            %li
              %a{:href => 's/3'}
                .title Snippet 3
                .info viewed 8 times
            %li
              %a{:href => 's/4'}
                .title Snippet 4
                .info 4 views
        .side_section
          %h4 Tags
          %ul#tags
            %li
              %a{:href => 't/tag1'}tag1
            %li
              %a{:href => 't/tag2'}tag2
            %li
              %a{:href => 't/tag3'}tag3
            %li
              %a{:href => 't/tag4'}tag4
            %li
              %a{:href => 't/tag5'}tag5
            %li
              %a{:href => 't/tag6'}tag6
            %li
              %a{:href => 't/tag7'}tag7

