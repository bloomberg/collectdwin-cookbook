#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

# Parameters for sc.exe, which lets us set failure actions
# see: https://technet.microsoft.com/en-us/library/cc742019.aspx
actions = node['collectdwin']['service']['failure_recovery']['actions']
reset = node['collectdwin']['service']['failure_recovery']['reset']
optional = node['collectdwin']['service']['failure_recovery']['optional']

execute 'collectdwin_sc_config' do
  command "sc.exe failure CollectdWinService #{optional} reset= #{reset} actions= #{actions}"
  action :nothing
end

if !node['packages'] ||
   !node['packages']['CollectdWinService'] ||
   node['packages']['CollectdWinService']['version'] != node['collectdwin']['service']['package_version']
  windows_package_core node['collectdwin']['service']['name'] do
    action :install
    source node['collectdwin']['service']['package_source']
    installer_type :msi
    options 'REINSTALLMODE="amus" /qn'
    notifies :run, 'execute[collectdwin_sc_config]', :delayed
  end
end

collectdwin_config 'CollectdWin.config' do
  cfg_name 'collectd_win_config'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['collectd_win_config']
  notifies :restart, "windows_service[#{node['collectdwin']['service']['name']}]", :delayed
end

include_recipe 'collectdwin::statsd'
include_recipe 'collectdwin::windows_performance_counter'
include_recipe 'collectdwin::write_http'
include_recipe 'collectdwin::amqp'

windows_service node['collectdwin']['service']['name'] do
  action [:enable, :start]
  startup_type :automatic
end
