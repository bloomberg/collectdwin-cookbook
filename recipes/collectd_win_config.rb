collectdwin_config "CollectdWin.config" do 
    directory = node['collectdwin']['cfg_dir']
    configuration['collectd_win_config'] = node['collectdwin']['plugins']['collectd_win_config']
end