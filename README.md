Fantassist
===========

This codebase is the foundation for what will be Fantassist. The remaining functionality in Fantassist is currently in development on a fork, which includes the heart of Fantassist -- the suggestion algorithm. This repo is essentially an example of a simple Backbone/Rails application.

This simplified version of Fantassit can be seen live at [fantassist.herokuapp.com](fantassist.herokuapp.com).

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
* Google Oauth2 Authentication
* Coffeescript
* Haml layout files
* Mustache templates
* Bootstrap front-end framework
* Capybara & Selenium feature specs
* RSpec unit and request specs (request specs for testing the Rails API backend)


# Local Setup
```sh
$ bundle install
$ rake db:setup
```

To run the app locally:
* add `127.0.0.1 	local.herokuapp.com` to your `/etc/hosts` file
  * `$ sudo echo '127.0.0.1 	local.herokuapp.com' >> /etc/hosts`
* `rails s`
* navigate to `local.herokuapp.com:3000` in your browser. sign in through Google when prompted. 
