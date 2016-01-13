#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

collectdwin_config 'WriteHttp.config' do
  cfg_name 'write_http'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['write_http']
  notifies :restart, "windows_service[#{node['collectdwin']['service']['name']}]", :delayed
end
