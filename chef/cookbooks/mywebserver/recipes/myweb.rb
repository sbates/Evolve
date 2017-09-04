httpd_service 'default' do
  listen_ports ['80', '443']
  action [:create, :start]
end
  
  httpd_config 'default' do
    source 'default.conf.erb'
    notifies :restart, 'httpd_service[default]'
  end
  
  template '/var/www/index.html' do
    source 'index.html.erb'
  end