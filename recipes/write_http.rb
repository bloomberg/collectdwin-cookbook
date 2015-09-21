collectdwin_config "WriteHttp.config" do 
    cfg_name 'write_http'
    directory node['collectdwin']['service']['cfg_dir']
    configuration node['collectdwin']['plugins']['write_http']
end