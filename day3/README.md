# Day 3 Write a Failing Test

Unit Tests

Unite tests check individual components (units) of code for intent. The example in this cookbook is written with chefspec.

A cookbook unit test file goes in spec/unit/recipes/cookbookname_spec.rb

Write unit tests that check to see if
* the httpd package is installed
* a /var/www/index.html tempate is created
* the httpd service is enabled
* the httpd service is started

Run the test in the cookbook root: 
`chef exec rspec`

This should fail as we have not written any code yet

```
Finished in 0.72082 seconds (files took 2.13 seconds to load)
4 examples, 3 failures

Failed examples:

rspec ./spec/unit/recipes/default_spec.rb:30 # mywebserver::default installs httpd
rspec ./spec/unit/recipes/default_spec.rb:35 # mywebserver::default creates a template for the home page
rspec ./spec/unit/recipes/default_spec.rb:39 # mywebserver::default enables and starts the httpd servce
```