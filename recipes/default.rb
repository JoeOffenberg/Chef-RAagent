#
#
# Cookbook Name:: RAagent
# Recipe:: default
#
# Copyright 2015, Joe Offenberg,
#           CA Technologies
# 
# All rights reserved - Do Not Redistribute
#

print "RA Server: #{node[:RAagent][:RA_Server]}\n"

remote_file "#{Chef::Config[:file_cache_path]}/nolio_agent_linux_5_5_0_b831.sh" do
  source "http://#{node[:RAagent][:RA_Server]}:#{node[:RAagent][:RA_Server_Port]}/nolio-app/apps/nolio_agent_linux_5_5_0_b831.sh"
  action :create_if_missing
end
if !File.exist?("#{node[:RAagent][:install_dir]}/nolio_agent.sh")
  execute "install RA agent" do
  command "sh #{Chef::Config[:file_cache_path]}/nolio_agent_linux_5_5_0_b831.sh -q -Vsys.installationDir=#{node[:RAagent][:install_dir]} -Vnolio.execution.name=#{node[:RAagent][:RA_Server]} -Vnolio.execution.port=#{node[:RAagent][:RA_ES_nimi_Port]} -Vnolio.nimi.port=6600 -Vnolio.nimi.secured=false"
end
end

service "nolioagent" do
  action :nothing
  supports :status => true, :start => true, :stop => true, :restart => true
end

template "#{node[:RAagent][:install_dir]}/conf/nimi_config.xml" do
  source "nimi_config.xml.erb"
  action :create
  notifies :restart, 'service[nolioagent]'
end

template "#{node[:RAagent][:install_dir]}/conf/agent.mapping.xml" do
  source "agent.mapping.xml.erb"
  action :create
  notifies :restart, 'service[nolioagent]'
end
