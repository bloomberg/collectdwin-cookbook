#
# Cookbook: CollectdWin-cookbook
#
# Copyright (c) 2015 Bloommberg L.P., All Rights Reserved.
#

windows_package 'CollectdWinService' do
  action :install
  source 'C:\github\bloomberg\collectdwin\src\installer\bin\x64\Debug\CollectdWin-x64.msi'
end

include_recipe 'CollectdWin-cookbook::collectd_win_config'
include_recipe 'CollectdWin-cookbook::statsd'
include_recipe 'CollectdWin-cookbook::windows_performance_counter'
include_recipe 'CollectdWin-cookbook::write_http'
include_recipe 'CollectdWin-cookbook::amqp'