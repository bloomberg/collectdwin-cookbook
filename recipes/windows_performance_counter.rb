#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

collectdwin_config 'WindowsPerformanceCounter.config' do
  cfg_name 'windows_performance_counter'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['windows_performance_counter']
  notifies :restart, "windows_service[#{node['collectdwin']['service']['name']}]", :delayed
end
