#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

# This  node['collectdwin']['service']['failure_actions'] should be an 3 element of
# array of 2 element arrays,
# where the first element is one of the following failure actions:
# 1. restart - restarts the service
# 2. run - Runs a command, as given by node['collectdwin']['service']['failure_command']
# 3. reboot - Reboots the machine, broadcasting message given by node['collectdwin']['service']['failure_reboot']
#	(note that quotes in the string must be escaped
# The second element is the time to wait in milliseconds before taking action.
# Each pair corresponds the the failure count, so the first failure action will be run at the first failure, and so on.

failure_reboot = node['collectdwin']['service'].key?('failure_reboot') ? "\"#{node['collectdwin']['service']['failure_reboot']}\"" : '""'
failure_command = node['collectdwin']['service'].key?('failure_command') ? "\"#{node['collectdwin']['service']['failure_command']}\"" : '""'

execute 'sc_failure_config' do
  command "sc.exe failure #{node['collectdwin']['service']['name']} \
reset= #{node['collectdwin']['service']['failure_reset_time(s)']} \
command= #{failure_command} reboot= #{failure_reboot} \
actions= #{node['collectdwin']['service']['failure_actions'].flatten.join('/')}"
  action :run
end
