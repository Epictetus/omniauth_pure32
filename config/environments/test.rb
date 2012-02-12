OmniauthDemo::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The test environment is used exclusively to run your application's
  # test suite.  You never need to work with it otherwise.  Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs.  Don't rely on the data there!
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr
end

Rails.application.config.middleware.use OmniAuth::Builder do
  # ALWAYS RESTART YOUR SERVER IF YOU MAKE CHANGES TO THESE SETTINGS!
  
  # you need a store for OpenID; (if you deploy on heroku you need Filesystem.new('./tmp') instead of Filesystem.new('/tmp'))
  require 'openid/store/filesystem'
  
  # load certificates
  require "openid/fetchers"
  OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"
  
  # identity
  provider :identity, :fields => [:email], :model => User
  
  # providers with id/secret, you need to sign up for their services (see below) and enter the parameters here
  provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :github, 'CLIENT ID', 'SECRET'
    
  
  # generic openid
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'open_id'
  
  # dedicated openid
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  # provider :google_apps, OpenID::Store::Filesystem.new('./tmp'), :name => 'google_apps'
  # /auth/google_apps; you can bypass the prompt for the domain with /auth/google_apps?domain=somedomain.com
  
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'aol', :identifier => 'openid.aol.com'
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp'), :name => 'myopenid', :identifier => 'myopenid.com'
  
  # Sign-up urls for Facebook, Twitter, and Github
  # https://developers.facebook.com/setup
  # https://github.com/account/applications/new
  # https://developer.twitter.com/apps/new
end

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = {
    'provider' => 'facebook',
    'uid' => '123545',
    'extra' => {
      'raw_info' => {
        'email' => "joe@example.com",
        'name' => "Joe Q Public"
      }
    }
  }
