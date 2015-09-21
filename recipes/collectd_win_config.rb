collectdwin_config 'CollectdWin.config' do
  cfg_name 'collectd_win_config'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['collectd_win_config']
end
