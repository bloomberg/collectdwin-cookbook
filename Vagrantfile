#
# Cookbook: CollectdWin-cookbook
#

%w(vagrant-berkshelf vagrant-cachier vagrant-omnibus).each do |name|
  fail "This project requires the '#{name}' Vagrant plugin!" unless Vagrant.has_plugin?(name)
end
Vagrant.configure('2') do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.cache.scope = :box

  config.ssh.forward_agent = true
  config.vm.box = ENV.fetch('VAGRANT_VM_BOX', 'opscode-centos-6.6')
  config.vm.box_url = ENV.fetch('VAGRANT_VM_BOX_URL', 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box')

  # Define an instance which uses this cookbook to create a Sandbox
  # environment for developing Chef infrastructure.
  config.vm.define :instance, primary: true do |guest|
    guest.vm.provision :chef_zero do |chef|
      chef.nodes_path = File.expand_path('../.vagrant/chef/nodes', __FILE__)
      chef.run_list = %w(CollectdWin-cookbook::default)
    end
  end
end

# ----------------------------------------------------------------------------
# Copyright (C) 2015 Bloomberg Finance L.P.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ----------------------------- END-OF-FILE ----------------------------------
