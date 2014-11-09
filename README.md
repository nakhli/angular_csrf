angular_csrf                                                                                       
=============

Extends the CSRF protection in Rails to play nicely with AngularJS.

[![Build Status](https://travis-ci.org/Sinbadsoft/angular_csrf.svg)](https://travis-ci.org/Sinbadsoft/angular_csrf)

Once installed, angular_csrf "just works": No need to change or configure neither the AngularJS javascript code nor the Rails application.

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
* Sends back the CSRF token as a http header, by deafault: `X-XSRF-TOKEN`

angular_csrf makes the Rails application or API (1)set the CSRF token in the expected cookie and (2)read back the
http header set by AngularJS. The angular_csrf rails initializer [extends the application controllers](https://github.com/Sinbadsoft/angular_csrf/blob/master/lib/angular_csrf.rb) to perform these tasks.
