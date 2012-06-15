Discepto
========

Discuss your designs (code/graphics/writing) with a group.

Setup
-----

Run the server with foreman:

    foreman start -p 3000

Running tests
-------------

You must run guard with foreman for the tests to pass, since Foreman sets
environment variables.

Run guard with:

    foreman run guard

Run the whole suite with:

    rake

Run individual unit test with:

    rspec spec/models/user_spec.rb

Run individual acceptance tests with:

    cucumber features/create_discussion.feature
