Discepto
========

Share and discuss creative work, including images, code, and plain text.

Setup
-----

Clone the repo:

    git clone git@github.com:jsteiner/discepto.git

Set up the app:

    cd discepto
    bundle
    rake db:create
    rake db:migrate

Edit your .env file:

    cp sample.env .env
    vi .env # Paste in the real values

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
