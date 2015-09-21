collectdwin_config 'WindowsPerformanceCounter.config' do
  cfg_name 'windows_performance_counter'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['windows_performance_counter']
end
