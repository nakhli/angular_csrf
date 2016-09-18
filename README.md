angular_csrf                                                                                       
=============

Extends Rails CSRF protection to play nicely with AngularJS.

[![Build Status](https://travis-ci.org/nakhli/angular_csrf.svg)](https://travis-ci.org/Sinbadsoft/angular_csrf)
[![security](https://hakiri.io/github/nakhli/angular_csrf/master.svg)](https://hakiri.io/github/Sinbadsoft/angular_csrf/master)
[![Code Climate](https://codeclimate.com/github/nakhli/angular_csrf/badges/gpa.svg)](https://codeclimate.com/github/Sinbadsoft/angular_csrf)
[![Dependency Status](https://gemnasium.com/nakhli/angular_csrf.svg)](https://gemnasium.com/Sinbadsoft/angular_csrf)
[![Gem Version](https://badge.fury.io/rb/angular_csrf.svg)](http://badge.fury.io/rb/angular_csrf)

Once installed, angular_csrf **just works**: No need to change or configure neither the AngularJS javascript code
nor the Rails application.

CSRF is an exploit that allows malicious websites to do unauthorized actions on a website that trusts the user.
The angular_csrf gem extends the CSRF protection in Rails to match the naming convention used in AngularJS for the HTTP
header and cookie token names
(see [Cookie-to-Header Token](http://en.wikipedia.org/wiki/Cross-site_request_forgery#Cookie-to-Header_Token) CSRF
protection strategy for more details).

angular_csrf has a very small footprint and has only the rails gem as dependency.

## Getting Started

1. Add the following line to your `Gemfile`:
  ```ruby
  gem 'angular_csrf'
  ```
  
  Run the bundle command to install it.
  ```sh
  bundle install
  ```
2. Run the angular_csrf generator:
  ```sh
  rails generate angular_csrf
  ```
  
  The generator will install an initializer `initializers/angular_csrf.rb` which takes care of extending
  the application controllers to handle the expected AngularJS CSRF protection data.
3. You are done! Your app CSRF protection now plays nicely with AngularJS.

## How it works

AngularJS [deals with CSRF protection](https://docs.angularjs.org/api/ng/service/$http#cross-site-request-forgery-xsrf-protection) as follows:
* Reads the CSRF protection token form a cookie, by default `XSRF-TOKEN`
* Sends back the CSRF token as a http header, by default: `X-XSRF-TOKEN`

angular_csrf makes the Rails application or API set the expected cookie token and read and validate the
http header sent by AngularJS. angular_csrf installs a Rails initializer
[that extends the application controllers](https://github.com/Sinbadsoft/angular_csrf/blob/master/lib/angular_csrf.rb)
to perform these tasks.

## License

Licensed under the [MIT License](http://opensource.org/licenses/MIT).

Copyright Chaker Nakhli.
