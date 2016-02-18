#
# Cookbook: collectdwin-cookbook
#

require 'spec_helper'

describe_recipe 'collectdwin::default' do
  service_name = 'CollectdWinService'
  cached(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  it { expect(chef_run).to enable_windows_service(service_name) }
  it { expect(chef_run).to start_windows_service(service_name) }

  context 'with all default attributes' do
    it 'converges successfully' do
      chef_run
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
