collectdwin_config 'Statsd.config' do
  cfg_name 'statsd'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['statsd']
end
