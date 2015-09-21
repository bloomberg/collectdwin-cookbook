
windows_service node['collectdwin']['service']['name'] do
  action :stop
end

windows_package node['collectdwin']['service']['name'] do
  source node['collectdwin']['service']['package_source']
  installer_type :msi
  action :remove
end
