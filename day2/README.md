# Day 2 Generate a Basic Web Server with Chef
Chef DK comes with several utilities. The generate command will create a basic cookbook containing several default items including test folders and a basic Test Kitchen configuration. If you are developing new cookbooks often or managing the Chef implementations for several teams, it's possible to create a template cookbook structure for the generate command. In this case, for one cookbook, I use the generate command with a few options, specifically cookbook author, contact and license type.



```
chef generate cookbook mywebserver -b -C 'Sascha Bates' -m 'sascha.bates@gmail.com' -I 'apachev2'
Generating cookbook mywebserver
- Ensuring correct cookbook file content
- Ensuring delivery configuration
- Ensuring correct delivery build cookbook content

Your cookbook is ready. Type `cd mywebserver` to enter it.
```