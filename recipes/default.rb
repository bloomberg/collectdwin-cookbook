#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

if not node['packages']
   or not node['packages']['CollectdWinService']
   or not node['packages']['CollectdWinService']['version'] == node['collectdwin']['service']['package_version'] do
  windows_package_core node['collectdwin']['service']['name'] do
    action :install
    source node['collectdwin']['service']['package_source']
    installer_type :msi
    options 'REINSTALLMODE="amus" /qn'
  end

  collectdwin_config 'CollectdWin.config' do
    cfg_name 'collectd_win_config'
    directory node['collectdwin']['service']['cfg_dir']
    configuration node['collectdwin']['plugins']['collectd_win_config']
    notifies :restart, "windows_service[#{node['collectdwin']['service']['name']}]", :delayed
  end
end

include_recipe 'collectdwin::statsd'
include_recipe 'collectdwin::windows_performance_counter'
include_recipe 'collectdwin::write_http'
include_recipe 'collectdwin::amqp'

windows_service node['collectdwin']['service']['name'] do
  action [:enable, :start]
  startup_type :automatic
end
