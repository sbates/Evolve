# Evolve
An Evolving Web Server Example

This uses Chef and Test Kitchen to create a web server instance that can be run with Vagrant/Virtualbox or with the included Terraform configuration.

## Requirements
This project uses the following software:
* [Vagrant](http://www.vagrantup.com)
* [Virtualbox](https://www.virtualbox.org/wiki/VirtualBox)
* [Terraform](https://www.terraform.io/)
* [Chefdk](https://downloads.chef.io/chefdk)
* [Test Kitchen](https://github.com/test-kitchen/test-kitchen)
* [Kitchen-ec2 plugin](https://github.com/test-kitchen/kitchen-ec2)
* [Inspec](https://www.inspec.io)
* Ruby 2.4

Chefdk ships with Ruby, Test Kitchen and Inspec but I wanted to just call them out explicitly. In addition, the kitchen-ec2 gem is required. 

## Assumptions
* The listed software is installed and working properly
* You have a working AWS account and an existing credentials file

## Part 1 Generate a Cookbook
```
chef generate cookbook mywebserver -b -C 'Sascha Bates' -m 'sascha.bates@gmail.com' -I 'apachev2'
```
## Part 2 Write a Failing Test