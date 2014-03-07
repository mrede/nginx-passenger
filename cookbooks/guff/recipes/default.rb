#
# Cookbook Name:: guff
# Recipe:: default
#

# Create /home/http
directory "/home/http" do
  owner "label"
  group "root"
  mode 00644
  action :create
end

directory "/home/http/dev.guff.me.uk" do
  owner "label"
  group "root"
  mode 00644
  action :create
end

# run the nginx::default recipe to install nginx
include_recipe "nginx"

# deploy your sites configuration from the files/ driectory in your cookbook
cookbook_file "#{node['nginx']['dir']}/sites-available/dev.guff.me.uk" do
  owner "root"
  group "root"
  mode  "0644"
end

# enable your sites configuration using a definition from the nginx cookbook
nginx_site "dev.guff.me.uk" do
	enable true
end