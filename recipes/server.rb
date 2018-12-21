package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content "<h1>Hello World</h1>
    HOSTNAME : #{node['hostname']}
    IPADDRESS : #{node['ipaddress']}
    CPU : #{node['cpu']['0']['mhz']}
    MEMORY : #{node['memory']['total']}
  "
end

service 'httpd' do 
  action [:enable, :start]
end
