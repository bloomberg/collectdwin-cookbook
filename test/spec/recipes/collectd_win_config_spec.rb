require 'spec_helper'

describe_recipe 'CollectdWin-cookbook::collectd_win_config' do
  context 'with default attributes' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
      end.converge(described_recipe)
    end

    it do
      expect(chef_run).to create_collectdwin_config('CollectdWin.config')
        .with(cfg_name: 'collectd_win_config')
    end
    it { chef_run }
  end
end