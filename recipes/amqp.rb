collectdwin_config 'Amqp.config' do
  cfg_name 'amqp'
  directory node['collectdwin']['service']['cfg_dir']
  configuration node['collectdwin']['plugins']['amqp']
end
