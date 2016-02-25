#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

default['collectdwin']['service']['name']           = 'CollectdWinService'
default['collectdwin']['service']['cfg_dir']        = File.join(ENV['ProgramW6432'].to_s, 'Bloomberg LP', 'CollectdWin', 'config')
default['collectdwin']['service']['package_source'] = File.join('c:', 'scratch', 'collectdwin-x64.msi')

default['collectdwin']['plugins']['collectd_win_config']['general_settings']['attr']['interval']    =  30
default['collectdwin']['plugins']['collectd_win_config']['general_settings']['attr']['timeout']     =  120
default['collectdwin']['plugins']['collectd_win_config']['general_settings']['attr']['store_rates'] =  false

# Parameters for sc.exe, which lets us set failure actions
# see: https://technet.microsoft.com/en-us/library/cc742019.aspx
default['collectdwin']['service']['failure_recovery']['actions'] = 'restart/0/restart/0//'
default['collectdwin']['service']['failure_recovery']['reset'] = 3600
default['collectdwin']['service']['failure_recovery']['optional'] = ''
