Thoughts on This
================

Share and discuss creative work, including images, code, and plain text.

Setup
-----

Clone the repo:

    git clone git@github.com:jsteiner/thoughts_on_this.git

Set up the app:

    cd thoughts_on_this
    bundle
    rake db:create
    rake db:migrate

Edit your .env file:

    cp sample.env .env
    vi .env # Paste in the real values

If you are using pow, copy sample.powenv:

    cp sample.powenv .env
    vi .powenv # Paste in the real values

Note that chat functionality will not work without the Pusher environment variables being loaded.

Run the server with foreman to pick up on environment variables:

    foreman start -p 3000

Running tests
-------------

You must run guard with foreman for the tests to pass, since Foreman sets
environment variables.

Run guard with:

    foreman run guard

Run the whole suite with:

    rake

Run individual unit tests with:

    rspec spec/models/user_spec.rb

Run individual acceptance tests with:

    cucumber features/create_discussion.feature

Deployment
----------

Add remotes for production and staging:

    git remote add staging git@heroku.com:thoughts-staging.git
    git remote add production git@heroku.com:thoughts-production.git

Push changes to production and staging:

    git push staging
    git push production

If there are new migrations:

    heroku run rake db:migrate --app thoughts-staging
    heroku run rake db:migrate --app thoughts-production

    heroku restart --app thoughts-staging
    heroku restart --app thoughts-staging
