collectdwin_config "Statsd.config" do 
    directory = node['collectdwin']['cfg_dir']
    configuration['statsd'] = node['collectdwin']['plugins']['statsd']
end