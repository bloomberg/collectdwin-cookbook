collectdwin_config "WriteHttp.config" do 
    directory = node['collectdwin']['cfg_dir']
    configuration['write_http'] = node['collectdwin']['plugins']['write_http']
end