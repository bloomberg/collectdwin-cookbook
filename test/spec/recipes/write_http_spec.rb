require 'spec_helper'

describe_recipe 'CollectdWin-cookbook::write_http' do
  context 'with default attributes' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
      end.converge(described_recipe)
    end

    it do
      expect(chef_run).to create_collectdwin_config('WriteHttp.config')
        .with(cfg_name: 'write_http')
    end
    it { chef_run }
  end
end