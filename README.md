## API-based Rails seed.

This seed project provides a preconfigured API-based Rails app, including helpful development tools. based on the workflow of github user [heyellieday](http://github.com/heyellieday) with the following features:

* Token-based User Auth using [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth) gem which accomplishes:
  * Oauth2 authentication using [OmniAuth](https://github.com/intridea/omniauth).
  * Email authentication using [Devise](https://github.com/plataformatec/devise), including:
    * User registration
    * Password reset
    * Account updates
    * Account deletion
  * Support for [multiple user models](https://github.com/lynndylanhurley/devise_token_auth#using-multiple-models).
  * It is [secure](https://github.com/lynndylanhurley/devise_token_auth#security).
* Preconfigured User Model and RESTful controller, integrated with the above Auth system (Controller coming Soon!)
* Cross-Domain Requests (CORS) using [rack-cors](https://github.com/intridea/omniauth) gem.
* Enviroment Variables for secret keys using [figaro](https://github.com/plataformatec/devise) gem.
* Postgres DB for development and production for easy deployment to Heroku.
* Rest API helper client using [rest_client](https://github.com/plataformatec/devise) gem.
* Easy development mail server using [mail-catcher](https://github.com/plataformatec/devise) gem.
* Preconfigured mail sending service and welcome email template using [Mailgun](http://www.mailgun.com/)
* [POW](http://pow.cx/),[XIP.I0](http://xip.io/) and [LocalTunnel](http://localtunnel.me) integration for worry-free and accesible local development servers.
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

#Facebook
facebook_key: "FACEBOOK_KEY"
facebook_secret: "FACEBOOK_SECRET"

#Github
github_key: "GITHUB_KEY"
github_secret: "GITHUB_SECRET"

#Google
google_key: "GOOGLE_KEY"
google_secret: "GOOGLE_SECRET"


#mailcatcher config
xip_host: "XIP_HOST"


#Action Mailer
user_mailer_from_email: "USER_MAILER_FROM_EMAIL"
user_mailer_url: "USER_MAILER_URL"
user_mailer_subject: "USER_MAILER_SUBJECT"

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

###Mailcatcher Setup

###Action Mailer Setup

In your config/application.yml file, replace the relevant environment variables to configure your welcome email. You may wish to customize the view at app/views/mailers/user_mailer.html.erb.
The application.yml changes will affect this file:

~~~ruby
# app/mailers/user_mailer.rb
class UserMailer < ActionMailer::Base
  default from: ENV['user_mailer_from_email']

  def welcome_email(user)
    @user = user
    @url  = ENV['user_mailer_url']
    @site = ENV['user_mailer_subject']
    mail(to: @user.email, subject: @subject)
  end
end
~~~

###POW, XIP.IO, and LocalTunnel Setup
POW helps you setup dev servers easily at a TLD .dev domain that can be accessed on your computer. XIP.IO makes those same servers available to other machines on your network, such as an ipad or mobile device. LocalTunnel makes your server available to the entire internet. No more being restricted to just testing on your local machine!

####POW
POW is very easy to setup and run. The following is taken from the POW website:

To install or upgrade Pow, open a terminal and run this command:

~~~bash
curl get.pow.cx | sh
~~~

To set up a your Rails app, just symlink it into ~/.pow:

~~~bash
cd ~/.pow
$ ln -s /path/to/myapp
~~~
That's i! POW is now set up for rails app.

####XIP.IO

To setup XIP with your Rails App, first locate your LAN IP address. Your XIP.IO address would be the following, if your app name was myapp and your LAN IP address was 10.0.1.43:

~~~bash
http://myapp.10.0.1.43.xip.io/
~~~

####LocalTunnel

