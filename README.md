# Evolve
An Evolving Web Server Example

This uses Chef and Test Kitchen to create a web server instance that can be run with Vagrant/Virtualbox or with the included Terraform configuration.

- [Evolve](#evolve)
  * [Requirements](#requirements)
  * [Assumptions](#assumptions)
  * [Part 1 Generate a Cookbook](#part-1-generate-a-cookbook)
  * [Part 2 Write Failing Unit Tests](#part-2-write-failing-unit-tests)
    + [Run the Test](#run-the-test)
  * [Part 3 Write Code to Pass Unit Tests](#part-3-write-code-to-pass-unit-tests)
  * [Part 4 Use the httpd cookbook](#part-4-use-the-httpd-cookbook)
  * [Part 5 Inspec Integration Tests with Kitchen and Vagrant](#part-5-inspec-integration-tests-with-kitchen-and-vagrant)
  * [Part 6 Build an AWS Infrastructure with Terraform](#part-6-build-an-aws-infrastructure-with-terraform)

## Requirements
This project uses the following software:
* [Vagrant](http://www.vagrantup.com)
* [Virtualbox](https://www.virtualbox.org/wiki/VirtualBox)
* [Terraform](https://www.terraform.io/)
* [Chefdk](https://downloads.chef.io/chefdk)
* [Test Kitchen](https://github.com/test-kitchen/test-kitchen)
* [Kitchen-ec2 plugin](https://github.com/test-kitchen/kitchen-ec2)
* [Inspec](https://www.inspec.io)
* [Chefspec](https://github.com/chefspec/chefspec)
* Ruby 2.4

Chefdk ships with Ruby, Test Kitchen, Chefspec and Inspec but I wanted to also call them out explicitly. In addition, the kitchen-ec2 gem is required. 

## Assumptions
* The listed software is installed and working properly
* You have a working AWS account and an existing credentials file

## Part 1 Generate a Cookbook
```
chef generate cookbook mywebserver -b -C 'Sascha Bates' -m 'sascha.bates@gmail.com' -I 'apachev2'
```
## Part 2 Write Failing Unit Tests
Unit tests are written with chefspec and located at chef/cookbooks/mywebserver/spec/unit/recipes/default_spec.rb.

They test that a package is installed, a homepage template file is created and that the service is enabled and running.

### Run the Test
in the cookbook folder Evolve/chef/cookbooks/mywebserver run

 ``` chef exec rspec ```

 ```
 Finished in 0.66068 seconds (files took 1.78 seconds to load)
4 examples, 3 failures

Failed examples:

rspec ./spec/unit/recipes/default_spec.rb:28 # mywebserver::default installs httpd
rspec ./spec/unit/recipes/default_spec.rb:33 # mywebserver::default creates a template for the home page
rspec ./spec/unit/recipes/default_spec.rb:37 # mywebserver::default enables and starts the httpd servce
```

## Part 3 Write Code to Pass Unit Tests
See the code in Evolve/chef/cookbooks/mywebserver/spec/unit

```
chef exec rspec
....

Finished in 3.31 seconds (files took 1.8 seconds to load)
4 examples, 0 failures
```

## Part 4 Use the httpd cookbook 
Created a 2nd recipe called myweb.rb executing the same unit tests. Now we have 8 tests, all passing

files:
* Evolve/chef/cookbooks/mywebserver/recipes/myweb.rb
* Evolve/chef/cookbooks/mywebserver/spec/unit/recipes/myweb_spec.rb
```
Finished in 7.55 seconds (files took 1.88 seconds to load)
8 examples, 0 failures
```

## Part 5 Inspec Integration Tests with Kitchen and Vagrant
In this section we do away with the default recipe, write Inspec integration tests for myweb.rb and fix the breaking test for port 443. Following that we write the .kitchen.yml file to test with a basic vagrant centos box.
files:
* Evolve/chef/cookbooks/mywebserver/test/smoke/vagrant-myweb/myweb_test.rb
* Evolve/chef/cookbooks/mywebserver/.kitchen.yml

## Part 6 Build an AWS Infrastructure with Terraform
This section adds a terraform direction that creates a basic AWS dev infrastructure, including VPC, Internet Gateway, Public Subnet, Security Group and a Keypair specific to this project.
files: 
* Evolve/terraform/infra.tf
* Evolve/terraform/variables.tf

If you have aws credentials set up and ssh keys set up in the default location of ~/.ssh/id_rsa ~/.ssh/id_rsa.pub, you can run ```terraform apply``` and build the infrastructure.
