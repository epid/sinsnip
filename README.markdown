# SinSnip - A simple code snippet manager

## Overview
This is my implementation of [NavySnip](http://github.com/navyrain/navysnip),
a personal source code snippet repository.

I decided to reimplement the tool in Sinatra since it doesn't require the overhead of Rails and I want it to be **fast**.
I also used this project as an experiment with HAML and SASS. Plain CSS is used for the syntax highlighter...

It uses the [Sequel](http://sequel.rubyforge.org) ORM with the [CodeRay](http://coderay.rubychan.de/) syntax highlighter.

## Dependencies

  $ sudo gem install sinatra
  $ sudo gem install haml
  $ sudo gem install sequel
  $ sudo gem install coderay

## Setup

All you have to do is run the server, the database is automatically created for you.

  $ ruby sinsnip.rb

Open your web broswer and visit [http://localhost:4567](http://localhost:4567) and click the "New Snippet" button to get started.

## About

Written by Jared Giles

Based off of [NavySnip](http://github.com/navyrain/navysnip)

Screenshots: [http://epid.github.com/sinsnip/sinsnip.png](http://epid.github.com/sinsnip/sinsnip.png)
