#
# Cookbook: CollectdWin-cookbook
#

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
