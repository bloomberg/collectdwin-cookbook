#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

collectdwin_config 'Amqp.config' do
  cfg_name 'amqp'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['amqp']
  notifies :restart, "windows_service[#{node['collectdwin']['service']['name']}]", :delayed
end
