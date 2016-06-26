#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

service_name="apache2"
package_name="apache2"
doc_root="var/www"


if node['platform'] == 'centos'
	service_name="httpd"
	package_name="httpd"
	doc_root="/var/www"
end
# Install apache 
package package_name do 
	action :install 
end

#start service - make sure the service starts on reboot 
service service_name do
	action [ :start, :enable ]
end

# createa home homepage

# cookbook_file "#{doc_root}/index.html" do 
# 	source "index.html"
# 	mode "0644"
# end

template "#{doc_root}/index.html" do 
	source "index.html.erb"
	mode "0644"
end

