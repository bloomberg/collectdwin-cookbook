#
# Cookbook: collectdwin
# License: Apache 2.0
#
# Copyright 2015-2016, Bloomberg Finance L.P.
#

windows_service node['collectdwin']['service']['old_name'] do
  ignore_failure true
  action [:stop, :disable]
end

windows_package node['collectdwin']['service']['old_name'] do
  ignore_failure true
  source node['collectdwin']['service']['old_package_source']
  installer_type :msi
  action :remove
end
