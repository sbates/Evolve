# # encoding: utf-8

# Inspec test for recipe mywebserver::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('httpd') do
  it { should be_installed }
end

describe file ('/var/www/index.html') do
its('content') { should match "Automation for the People\n" }
end

[80, 443].each do |p|
  describe port(p) do
    it { should be_listening }
  end
end