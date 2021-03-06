Fantassist [![Build Status](https://travis-ci.org/clembradley/fantassist.svg?branch=install-travis)](https://travis-ci.org/clembradley/fantassist)
===========

This codebase is the foundation for what will be Fantassist. The remaining functionality in Fantassist is currently in development on a fork, which includes the heart of Fantassist -- the suggestion algorithm. This repo is essentially an example of a simple Backbone/Rails application.

This simplified version of Fantassit can be seen live at [fantassist.herokuapp.com](http://fantassist.herokuapp.com).

## What Fantassist Will Be

Fantassist is a fantasy baseball draft pick suggestion tool. It seeks to recommend the optimal draft pick for any given state of a draft. a use case scenario:
* A user is participating in a fantasy baseball draft with other users in a league
* During the live draft, the user tracks the state of the draft in Fantassist by manually synchronizing the picks made in the main draft to Fantassist
* At each state of the draft, Fantassist will analayze the current state of the draft and recommend the optimal draft pick to the user, based on various factors including position scarcity and available talent

### Missing Features
* Currently a player only has one position. In the future a player will be able to have many positions (like in real life).
* Roster definition. Different leagues have different sets of positions available for each roster. 
* Concept of a league with other drafters. In order to track the state of an actual live draft, these concepts must first be implemented.
* Support for API clients. Currently use of the API is limitted to someone signed in through Google. 

## What This Codebase Is
* The initial design schema for user, drafter, and draft pick relationships
* The basic UI for drafting players

### Features
* Single-page Backbone.js app for the draft engine
* REST API built on Rails
* Continuous Integration with Travis
* Capybara & Selenium feature specs
* RSpec unit and request specs (request specs for testing the Rails API backend)
* Google Oauth2 Authentication
* Bootstrap front-end framework
* Coffeescript over JavaScript
* Haml layout files
* Mustache templates


# Local Setup
Fantassist is a Ruby on Rails app, and thus requires the following to already be installed: 
* RVM
* Ruby 2.1.1
* Bundler (for gem dependency management)
* Postgresql database
* Git

In a Linux/Mac console
```sh
$ git clone https://github.com/clembradley/fantassist.git
$ cd fantassist
$ bundle install
$ rake db:setup
```

To run the app locally:
```sh
$ rails server
```
* navigate to `localhost:3000` in your browser. a test-user will be used instead of a real Google account when signing in. 
