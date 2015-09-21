
windows_package node['collectdwin']['service']['name'] do
  action :install
  source node['collectdwin']['service']['package_source']
  installer_type :msi
end

include_recipe 'CollectdWin-cookbook::collectd_win_config'
include_recipe 'CollectdWin-cookbook::statsd'
include_recipe 'CollectdWin-cookbook::windows_performance_counter'
include_recipe 'CollectdWin-cookbook::write_http'
include_recipe 'CollectdWin-cookbook::amqp'

windows_service node['collectdwin']['service']['name'] do
  action :enable
  startup_type :automatic
end

windows_service node['collectdwin']['service']['name'] do
  action :start
  startup_type :automatic
end
