collectdwin_config "WindowsPerformanceCounter.config" do 
    directory = node['collectdwin']['cfg_dir']
    configuration['windows_performance_counter'] = node['collectdwin']['plugins']['windows_performance_counter']
end