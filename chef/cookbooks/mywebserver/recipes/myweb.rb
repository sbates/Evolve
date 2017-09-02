httpd_service 'default' do
    action [:create, :start]
  end
  
  httpd_config 'default' do
    source 'default.conf.erb'
    notifies :restart, 'httpd_service[default]'
  end
  
  template '/var/www/index.html' do
    source 'index.html.erb'
  end