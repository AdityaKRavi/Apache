package 'httpd' do
  action :install
end

template '/etc/motd' do
  source 'motd.erb'
  variables(
    :name => 'adityakravi'
  )
end

#remote_file 'var/www/html/adi.jpg' do
#  source 'https://www.shutterstock.com/image-vector/cute-cartoon-kids-writing-test-classroom-364684505.jpg'
#end

template 'var/www/html/index.html' do
  source 'index.html.erb'
  action :create
  notifies :restart ,'service[httpd]', :immediately
end

service 'httpd' do 
   action [:enable, :start]
end
