# Day 1 Set up the Local Development Environment
This project will make use of several open source software projects. At the end of this day you will have:
* Installed a code editor of your choice
* Installed Vagrant 
* Installed Virtualbox 
* Installed the Chef development kit which also installs
    * Inspec 
    * Test Kitchen
    * Berkshelf
    * Embedded Ruby 2.4
* Created a working directory

### Code Editor
You will want a code editor. While, this can all be done in a terminal editor if you want and I often forget to use the code editor and just vim my way through edits, generally an editor is nicer for organization. There are several good editors: Sublime Text, Atom, Visual Studio Code and several others. Just pick one. I won't judge.

### Local Virtualization
[Virtualbox Home Page](https://www.virtualbox.org/wiki/VirtualBox)
In order to rapidly test and verify our efforts, we will install local virtualization and automation tools. Virtualbox is free and commonly used. This example set will use Virtualbox as it is supported by default by both Vagrant and Test Kitchen. Other commonly used virtualization solutions are Hyper-V on windows and a variety of cloud drivers.

Eventually we will also use an AWS EC2 driver.

### Vagrant
[Vagrant Home Page](http://www.vagrantup.com)
We automate our local virtual machines with Vagrant.

### Chef Development Kit
[Chefdk](https://downloads.chef.io/chefdk)

The ChefDK is a rich toolset allowing us to write, test and deploy automation code to our local VM. 

### Verify the Tools
At the moment, exact versions are not important. This is just what I happen to have on my laptop. Ensure you have the tools installed and availabe in your path.

#### Vagrant
```
Macaroon:day1 sascha$ vagrant -v
Vagrant 1.9.7
Macaroon:day1 sascha$ which vagrant
/usr/local/bin/vagrant
```
#### Virtualbox
```
Macaroon:day1 sascha$ VBoxManage -v
5.1.22r115126
Macaroon:day1 sascha$ which VBoxManage
/usr/local/bin/VBoxManage
```
#### Chef Development Kit Tools
```
Macaroon:day1 sascha$ chef -v
Chef Development Kit Version: 2.0.28
chef-client version: 13.2.20
delivery version: master (17c1b0fed9be4c70f69091a6d21a4cbf0df60a23)
berks version: 6.2.0
kitchen version: 1.16.0
inspec version: 1.31.1

Macaroon:day1 sascha$ which chef
/opt/chefdk/bin/chef
```
#### Working Directory
The place we'll be doing all our work:
mkdir ~/evolve