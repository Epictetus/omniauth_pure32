# OmniAuth Pure

[![Build Status](https://secure.travis-ci.org/msimkins/omniauth_pure32.png)](http://travis-ci.org/msimkins/omniauth_pure32)

## Fork Details

### \*\*\* Important \*\*\*

This fork upgrades the origin project to Rails 3.2.2 and OmniAuth 1.0.x. I have added some tests to the code using RSpec and Capybara
to provide some level of confidence that the code 'does the right thing'

### \*\*\* Ruby Versions Supported \*\*\*

Currently this has only been tested under MRI Rubies 1.9.2 +

If you wish to patch it to use JRuby or Rubinius, please feel free to fork this, and send me a pull request.

## Article

Read the full article "Omniauth pure: Authentication with Facebook, Google, Google Apps, Twitter, Github, AOL, MyOpenID and many other OpenID providers" on CommunityGuides: 
http://www.communityguides.eu/articles/16

This article will demonstrate how to set up a multi-provider authentication using the fabulous OmniAuth gem. Users will be able to add multiple providers to their account and views for sign-in, sign-up and management of linked accounts are provided. The full source code is available on Github as a basis for your own projects.

## Ruby on Rails CommunityGuides

Ruby on Rails CommunityGuides follows the purpose of giving back to open source - more specific, to the Rails community. It has been built to provide a basis to share knowledge on Ruby on Rails development. Developers from all over the world can share their knowledge easily and gain profit from the knowledge of other developers. All content is free and published under a Creative Commons license.

## Credits

* OmniAuth: [http://github.com/intridea/omniauth](http://github.com/intridea/omniauth)

* OmniAuth Buttons: [http://github.com/intridea/authbuttons](http://github.com/intridea/authbuttons)

## Using OmniAuth Pure in your Rails app

* add OmniAuth to your gems

* generate a user model with whatever fields you like: rails generate model user name:string ...

* generate the service model: rails generate model service user_id:integer provider:string uid:string uname:string uemail:string

* generate the service controller: rails generate controller services

* set the secret for the cookie store in config/initializers/session_store!

* copy part of routes.rb

* copy the models service.rb and user.rb (or edit, if you already have a user model!)

* copy the code of the services_controller

* copy all views from services

* copy (parts of) the stylesheet

* and refer to the article for details...