#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

collectdwin_config 'Statsd.config' do
  cfg_name 'statsd'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['statsd']
  notifies :restart, "windows_service[#{node['collectdwin']['service']['name']}]", :delayed
end
