# Evolve
An Evolving Web Server Example

This is a project I've been playing with to get some practice in on tools I haven't touched in a year. I was thinking about the couch to 5k program the other day and thought it might be neat to structure this similarly.

The project uses a variety of open source tools to create and test a web server in different infrastructures.

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

Day 1 - Set up local development environment
Day 2 - Generate a basic webserver cookbook with Chef tools
Day 3 - Write failing unit tests 
Day 4 - Write code to pass unit tests