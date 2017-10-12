describe package('httpd') do
  it { should be_installed }
end

describe file ('/var/www/index.html') do
its('content') { should match "A Very Bratty Webserver\n" }
end

[80, 443].each do |p|
  describe port(p) do
    it { should be_listening }
  end
end
