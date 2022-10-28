# Jedis App

## Description

This app ables the user to register some people data (aka municipe) in order to use/consult it later. There is the possibility to query the data using flexible filters. It also sends SMS and Emails automatically when register people's data.

It uses Ruby 3.0.0 and Rails ~> 7.0.4.

## Features

- register data

- query with flexible filters

- pagination


## What does the course teaches:

- TDD using RSpec

- Ruby & Ruby on Rails

- Javascript

- StimulusJS

- Bootstrap

- Pagination with Kaminari

- Handle sms with Twilio

- Send emails with action mailer

## How to use/interact with this app:

Create a database and run the seed file using the following commands:

`rails db:create db:migrate db:seed`

On this point, the database has lot of data to demonstrate how the application works.

## Tests

The project uses Rspec for testing. To run it run in the root project

`bundle exec rspec`

It will run all the test suite.
