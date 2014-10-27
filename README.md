## API-based Rails seed.

This seed project provides a preconfigured Rails app based on the workflow of github user [heyellieday](http://github.com/heyellieday) with the following features:

* Token-based User Auth using [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth) gem which accomplishes:
  * Oauth2 authentication using [OmniAuth](https://github.com/intridea/omniauth).
  * Email authentication using [Devise](https://github.com/plataformatec/devise), including:
    * User registration
    * Password reset
    * Account updates
    * Account deletion
  * Support for [multiple user models](https://github.com/lynndylanhurley/devise_token_auth#using-multiple-models).
  * It is [secure](#security).
 * Cross-Domain Requests (CORS) using [rack-cors](https://github.com/intridea/omniauth) gem.
 * Enviroment Variables for secret keys using [figaro](https://github.com/plataformatec/devise) gem.
 * Postgres DB for development and production for easy deployment to Heroku.
 * Rest API helper client using [rest_client](https://github.com/plataformatec/devise) gem.

# [Live Demo](http://ng-token-auth-demo.herokuapp.com/)

# Dependencies
This seed app leverages the following gems:

* [Devise](https://github.com/plataformatec/devise)
* [OmniAuth](https://github.com/intridea/omniauth)
* [omniauth-github](https://github.com/plataformatec/devise)
* [omniauth-facebook](https://github.com/intridea/omniauth)
* [omniauth-google-oauth2](https://github.com/intridea/omniauth)
* [devise_token_auth](https://github.com/plataformatec/devise)
* [rack-cors](https://github.com/cyu/rack-cors)
* [figaro](https://github.com/laserlemon/figaro)
* [pg](https://github.com/intridea/omniauth)
* [rest_client](https://github.com/plataformatec/devise)
* [json](https://rubygems.org/gems/json)
* [mailcatcher](https://github.com/intridea/omniauth)

# Installation
Add the following to your `Gemfile`:

~~~ruby
gem 'devise_token_auth'
~~~

Then install the gem using bundle:

~~~bash
bundle install
~~~
