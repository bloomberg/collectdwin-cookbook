require 'spec_helper'

describe_recipe 'CollectdWin-cookbook::default' do
  service_name = 'CollectdWinService (64 bit)'
  cached(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  it { expect(chef_run).to enable_windows_service(service_name) }
  it { expect(chef_run).to start_windows_service(service_name) }

  context 'with all default attributes' do
    it 'converges successfully' do
      chef_run
    end
  end
end
