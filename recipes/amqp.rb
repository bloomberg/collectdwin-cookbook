collectdwin_config "Amqp.config" do 
    directory = node['collectdwin']['cfg_dir']
    configuration['amqp'] = node['collectdwin']['plugins']['amqp']
end