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
* Easy development mail server using [mail-catcher](https://github.com/plataformatec/devise) gem.
* Preconfigured mail sending service and welcome email template using [Action Mailer](http://guides.rubyonrails.org/action_mailer_basics.html)
* And more!

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
Clone the repo to your development folder::

~~~bash
git  clone https://github.com/heyellieday/rails-api-seed/
~~~

Then do a quick bundle install:

~~~bash
bundle install
~~~

There are then some configuration steps to complete, as outlined in the following section

# Configuration
###Figaro Setup

In your root project directory run:
~~~bash
figaro install
~~~
This will great an application.yml in your config folder. Copy the following sample config info into application.yml, replacing the current contents:

~~~yml
#Postgres DB config
postgress_db_name: "<RAILS APP NAME>"
postgres_user: "<RAILS APP NAME>"

#Omniauth Providers
#
#Facebook
facebook_key: "FACEBOOK_KEY"
facebook_secret: "FACEBOOK_SECRET"
#
#Github
github_key: "GITHUB_KEY"
github_secret: "GITHUB_SECRET"
#
#Google
google_key: "GOOGLE_KEY"
google_secret: "GOOGLE_SECRET"

~~~
These values be talked about in more detail in the following sections.


###Postgres Setup

Install Postgres on your machine. If using OS X, follow this guide: [Installing Postgres via Homebrew](http://marcinkubala.wordpress.com/2013/11/11/postgresql-on-os-x-mavericks/)

Once installed, from the terminal, create the Postgres DB:
 
~~~bash
initdb /usr/local/var/<NAME OF RAILS APP> -E utf8
~~~
 
Then start the Postgres server:
 
~~~bash
postgres -D /usr/local/var/<NAME OF RAILS APP>
~~~

In a new terminal tab, create a new user role:

~~~bash
createuser -d -P <NAME OF RAILS APP>
~~~

Update your application.yml file with the correct values for your Postgres config

Then associate the new DB with the Rails app, in your root project directory:

~~~bash
rake db:create
~~~

Run your migrations, populating your database:

~~~bash
rake db:migrate
~~~

###Postgres Setup

