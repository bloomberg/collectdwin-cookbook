#
# Cookbook: CollectdWin-cookbook
#

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

include_recipe 'CollectdWin-cookbook::statsd'
include_recipe 'CollectdWin-cookbook::windows_performance_counter'
include_recipe 'CollectdWin-cookbook::write_http'
include_recipe 'CollectdWin-cookbook::amqp'

windows_service node['collectdwin']['service']['name'] do
  action [:enable, :start]
  startup_type :automatic
end

# ----------------------------------------------------------------------------
# Copyright (C) 2015 Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------- END-OF-FILE ----------------------------------
